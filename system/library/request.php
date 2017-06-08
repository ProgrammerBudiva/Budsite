<?php
class Request {
	public $get = array();
	public $post = array();
	public $cookie = array();
	public $files = array();
	public $server = array();

	public function __construct() {
		$this->get = $this->clean($_GET);
		$this->post = $this->clean($_POST);
		$this->request = $this->clean($_REQUEST);
		$this->cookie = $this->clean($_COOKIE);
		$this->files = $this->clean($_FILES);
		$this->server = $this->clean($_SERVER);
	}

	public function clean($data) {
		if (is_array($data)) {
			foreach ($data as $key => $value) {
				unset($data[$key]);

				$data[$this->clean($key)] = $this->clean($value);
			}
		} else {
			$data = htmlspecialchars($data, ENT_COMPAT, 'UTF-8');
		}

		return $data;
	}


  /* Index restricted parameter check */
  public function hasRestrictedParams($rParams = []){
    if (!$rParams){
      $rParams = ['limit', 'page', 'sort', 'order', 'filter_ocfilter'];
    }

    foreach ($rParams as $param) {
      if (!empty($this->get[$param])) {
        return true;
      }
    }

    return false;
  }


  /* AJAX check  */
  public function isAjax() {
    return (!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest');
  }

  /**
   * Check if referer is within domain
   * @return bool
   */
  public function isLocalReferer(){
    return (!empty($_SERVER['HTTP_REFERER']) && preg_match('/https?:\/\/(www\.)?budsite\./ui', $_SERVER['HTTP_REFERER']) > 0);
  }
}