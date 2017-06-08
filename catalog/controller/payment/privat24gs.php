<?php
class ControllerPaymentprivat24gs extends Controller {
	public function index() {
		$data['button_confirm'] = $this->language->get('button_confirm');
		
		$this->load->model('checkout/order');
		
		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
        
        //$this->model_checkout_order->confirm($this->session->data['order_id'], 1, 'privat24gs');

		$uah_code = "UAH";
        $uah_order_total = $this->currency->convert($order_info['total'], $order_info['currency_code'], $uah_code);
        $amount = $this->currency->format($uah_order_total, $uah_code, $order_info['currency_value'], FALSE);



		$data['action'] = 'https://api.privatbank.ua/p24api/ishop';
		
        $data['result_url'] = $this->url->link('payment/privat24gs/callback', '', 'SSL');
        $data['server_url'] = $this->url->link('success/success_payment', '', 'SSL');
        $data['merchant_id'] = $this->config->get('privat24gs_merchant');
        $data['order_id'] = $this->session->data['order_id'];
        $data['amount'] = $amount;
        $data['currency'] = $uah_code;
        $data['description'] ='#' . $this->session->data['order_id'] . ' ' . $this->config->get('config_name') . ' ' . $order_info['payment_firstname'] . ' ' . $order_info['payment_address_1'] . ' ' . $order_info['payment_address_2'] . ' ' . $order_info['payment_city'] . ' ' . $order_info['email'];

        //new functional

        $curl = curl_init($data['action']);
        curl_setopt($curl, CURLOPT_FAILONERROR, true);
        curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_POSTFIELDS,
            [
                $data['result_url'],$data['server_url'],$data['merchant_id'],
                $data['order_id'],$data['amount'],$data['currency'],
                $data['description']
            ]
        );
        $res = curl_exec($curl);
        $this->session->data['privat_html'] = $res;

        /*//end of new functional
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/privat24gs.tpl')) {
            $this->session->data['privat_layout'] = $this->load->view($this->config->get('config_template') . '/template/payment/privat24gs.tpl', $data);
            return $this->load->view($this->config->get('config_template') . '/template/payment/privat24gs.tpl', $data);
        } else {
            $this->session->data['privat_layout'] = $this->load->view('default/template/payment/privat24gs.tpl', $data);
            return $this->load->view('default/template/payment/privat24gs.tpl', $data);
//            $this->response->setOutput('default/template/payment/privat24gs.tpl', $data);
        }*/
	}

	public function callback() {
        header('HTTP/1.0 200 OK');
        $this->load->model('checkout/order');
        //file_put_contents('privat24.txt',implode("\n",$_POST));
        if (isset($this->request->post['payment']) && isset($this->request->post['signature'])) {
            //file_put_contents('privat24.txt',"\nisset post\n",FILE_APPEND);
            $payment = html_entity_decode($_POST['pbudayment']);
            parse_str($payment, $result);
            $merchat_pass=$this->config->get('privat24gs_signature');
            $signature = sha1(md5($payment.$merchat_pass));
            //file_put_contents('privat24.txt',$signature."==".$_POST['signature']."\n",FILE_APPEND);
            if ($signature==$_POST['signature']) {
                //file_put_contents('privat24.txt',"state==".$result['state']."\n",FILE_APPEND);
                 if ($result['state']=="ok" || $result['state']=="test")  {
                    $order_id=$result['order'];
                     unset($this->session->data['reserve_cart']);
                     unset($this->session->data['order_id']);
                     $this->response->redirect($this->url->link('checkout/success/success_payment'));
                }
            } else {
                $this->session->data['cart'] = $this->session->data['reserve_cart'];
                $this->model_checkout_order->deleteOrder($this->session->data['order_id']);
                unset($this->session->data['order_id']);
                unset($this->session->data['reserve_cart']);
                $this->response->redirect($this->url->link('common/home'));
            }
        } else {
            $this->session->data['cart'] = $this->session->data['reserve_cart'];
            $this->model_checkout_order->deleteOrder($this->session->data['order_id']);
            unset($this->session->data['order_id']);
            unset($this->session->data['reserve_cart']);
            $this->response->redirect($this->url->link('common/home'));
        }

	}
}
?>