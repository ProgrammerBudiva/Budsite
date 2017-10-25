<?php
class ModelDkaDkaCart extends Model {

public function dkaGetCarts($start, $limit) {
	$data = null;

//	$sql = "SELECT IF(ISNULL(cart_id), 0, 1) AS cart FROM " . DB_PREFIX . "cart";
	$sql = "SELECT *  FROM " . DB_PREFIX . "customer WHERE cart IS NOT NULL";
//	$query = $this->db->countAffected($sql);
	$query = $this->db->query($sql);
//	echo "<pre>"; print_r($query); echo "</pre>";die;
	if($query){
//		$sql = "SELECT COUNT(DISTINCT cart_id) as total FROM " . DB_PREFIX . "cart";
//		$queryDefault = $this->db->query($sql);
//		$data['total'] = (int)$queryDefault->row['total'];
//		$sql = "SELECT * FROM " . DB_PREFIX . "cart ORDER BY customer_id ASC, date_added DESC";
//		$sql = "SELECT * FROM " . DB_PREFIX . "cart ORDER BY customer_id ASC, date_added DESC";
//		if (isset($start) || isset($limit)) { $sql .= " LIMIT " . (int)$start . "," . (int)$limit; }
		$query = $this->db->query($sql);

	  foreach ($query->rows as $result) {
	    $cart_id     = (int)$result['cart_id'];
	    $customer_id = (int)$result['customer_id'];
			$session_id  = (string)$result['session_id'];
			$product_id  = (int)$result['product_id'];
			$quantity 	 = (int)$result['quantity'];
			$date_added  = $result['date_added'];
			// Customer info
	    $queryCustomer = $this->db->query("SELECT firstname, lastname, email, telephone FROM " . DB_PREFIX . "customer WHERE customer_id = '" . $customer_id . "'");
	    $customer = null;
	    if(!count($queryCustomer->rows)){
	      $customer['firstname'] = '';
	      $customer['lastname']  = '';
	      $customer['email']     = '';
	      $customer['telephone'] = '';
	    }else{
	      $customer['firstname'] = $queryCustomer->rows[0]['firstname'];
	      $customer['lastname']  = $queryCustomer->rows[0]['lastname'];
	      $customer['email']     = $queryCustomer->rows[0]['email'];
	      $customer['telephone'] = $queryCustomer->rows[0]['telephone'];
	    }
			// Product image
	    $q_productImage = $this->db->query("SELECT image FROM " . DB_PREFIX . "product WHERE product_id = '" . $product_id . "'");
	    $d_productImage = null;
	    if(!count($q_productImage->rows)){
	      $d_productImage['image'] = '';
	    }else{
	      $d_productImage['image'] = $q_productImage->rows[0]['image'];
	    }
			// Product description
	    $s_productDesc = "SELECT name FROM " . DB_PREFIX . "product_description";
			$s_productDesc .= " WHERE product_id = '" . $product_id . "' AND language_id = '" . (int)$this->config->get('config_language_id') . "'";
			$q_productDesc = $this->db->query($s_productDesc);
	    $d_productDesc = null;
	    if(!count($q_productDesc->rows)){
	      $d_productDesc['name'] = '';
	    }else{
	      $d_productDesc['name'] = $q_productDesc->rows[0]['name'];
	    }
			// Carts data
	    $data['carts'][] = array(
	      'cart_id' 		=> $cart_id,
	      'customer_id' => $customer_id,
				'session_id'  => $session_id,
				'product_id'  => $product_id,
				'quantity_id' => $quantity,
				'date_added' 	=> $date_added,
	      'firstname'   => $customer['firstname'],
	      'lastname'    => $customer['lastname'],
	      'email'       => $customer['email'],
	      'telephone'   => $customer['telephone'],
				'image'   		=> $d_productImage['image'],
				'name'   			=> $d_productDesc['name'],
	    );
	  }
	}
	return $data;
}

public function dkaGetSearchCarts($start, $limit, $string) {
	$data = null;

	$sql = "SELECT COUNT(DISTINCT cart_id) as total FROM (" . DB_PREFIX . "cart c LEFT JOIN " . DB_PREFIX . "customer cus ON c.customer_id = cus.customer_id)";
	$sql .= " LEFT JOIN " . DB_PREFIX . "product_description pd ON c.product_id = pd.product_id";
	$sql .= " WHERE (cus.firstname LIKE '%" . $string . "%' OR cus.lastname LIKE '%" . $string . "%')";
	$sql .= " OR (cus.email LIKE '%" . $string . "%' OR cus.telephone LIKE '%" . $string . "%')";
	$sql .= " OR pd.name LIKE '%" . $string . "%'";
	$sql .= " ORDER BY c.customer_id ASC, c.date_added DESC";
	$queryDefault = $this->db->query($sql);
	$data['total'] = (int)$queryDefault->row['total'];

	$sql = "SELECT DISTINCT c.cart_id, c.customer_id, c.session_id, c.product_id, c.quantity, c.date_added  FROM (" . DB_PREFIX . "cart c LEFT JOIN " . DB_PREFIX . "customer cus ON c.customer_id = cus.customer_id)";
	$sql .= " LEFT JOIN " . DB_PREFIX . "product_description pd ON c.product_id = pd.product_id";
	$sql .= " WHERE (cus.firstname LIKE '%" . $string . "%' OR cus.lastname LIKE '%" . $string . "%')";
	$sql .= " OR (cus.email LIKE '%" . $string . "%' OR cus.telephone LIKE '%" . $string . "%')";
	$sql .= " OR pd.name LIKE '%" . $string . "%'";
	$sql .= " ORDER BY c.customer_id ASC, c.date_added DESC";
	if (isset($start) || isset($limit)) { $sql .= " LIMIT " . (int)$start . "," . (int)$limit; }
	$query = $this->db->query($sql);

  foreach ($query->rows as $result) {
    $cart_id     = (int)$result['cart_id'];
    $customer_id = (int)$result['customer_id'];
		$session_id  = (string)$result['session_id'];
		$product_id  = (int)$result['product_id'];
		$quantity 	 = (int)$result['quantity'];
		$date_added  = $result['date_added'];
		// Customer info
		$sql_customer = "SELECT firstname, lastname, email, telephone FROM " . DB_PREFIX . "customer WHERE customer_id = '" . $customer_id . "'";
    $queryCustomer = $this->db->query($sql_customer);
    $customer = null;
    if(!count($queryCustomer->rows)){
      $customer['firstname'] = '';
      $customer['lastname']  = '';
      $customer['email']     = '';
      $customer['telephone'] = '';
    }else{
      $customer['firstname'] = $queryCustomer->rows[0]['firstname'];
      $customer['lastname']  = $queryCustomer->rows[0]['lastname'];
      $customer['email']     = $queryCustomer->rows[0]['email'];
      $customer['telephone'] = $queryCustomer->rows[0]['telephone'];
    }
		// Product image
    $q_productImage = $this->db->query("SELECT image FROM " . DB_PREFIX . "product WHERE product_id = '" . $product_id . "'");
    $d_productImage = null;
    if(!count($q_productImage->rows)){
      $d_productImage['image'] = '';
    }else{
      $d_productImage['image'] = $q_productImage->rows[0]['image'];
    }
		// Product description
    $s_productDesc = "SELECT name FROM " . DB_PREFIX . "product_description";
		$s_productDesc .= " WHERE product_id = '" . $product_id . "' AND language_id = '" . (int)$this->config->get('config_language_id') . "'";
		$q_productDesc = $this->db->query($s_productDesc);
    $d_productDesc = null;
    if(!count($q_productDesc->rows)){
      $d_productDesc['name'] = '';
    }else{
      $d_productDesc['name'] = $q_productDesc->rows[0]['name'];
    }
		// Carts data
    $data['carts'][] = array(
      'cart_id' 		=> $cart_id,
      'customer_id' => $customer_id,
			'session_id'  => $session_id,
			'product_id'  => $product_id,
			'quantity_id' => $quantity,
			'date_added' 	=> $date_added,
      'firstname'   => $customer['firstname'],
      'lastname'    => $customer['lastname'],
      'email'       => $customer['email'],
      'telephone'   => $customer['telephone'],
			'image'   		=> $d_productImage['image'],
			'name'   			=> $d_productDesc['name'],
    );
  }
	return $data;
}

public function dkaCartDelete($cart_id){
	if(!isset($cart_id)){ return false; }
	$this->db->query("DELETE FROM " . DB_PREFIX . "cart WHERE cart_id = '" . (int)$cart_id . "'");
	return true;
}

public function dkaCartsDelete(){
	$this->db->query("DELETE FROM " . DB_PREFIX . "cart");
	return true;
}

}

?>
