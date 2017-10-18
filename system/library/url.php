<?php
class Url {
	private $domain;
	private $ssl;
	private $rewrite = array();
	private $seo_url;

	public function __construct($domain, $ssl = '') {
		$this->domain = $domain;
		$this->ssl = $ssl;
	}

	public function addRewrite($rewrite) {
		$this->rewrite[] = $rewrite;
	}

    public function link($route, $args = '', $secure = false) {
        if($_SERVER['PHP_SELF'] != '/admin/index.php') {
            $this->seo_url = $this->getUrlDetail($route);
        }

        if($this->seo_url === NULL) {
            if (!$secure) {
                $url = $this->domain;
            } else {
                $url = $this->ssl;
            }

            $url .= 'index.php?route=' . $route;

        }else{
            $url = $this->seo_url;

        }

        if ($args) {
            $url .= str_replace('&', '&amp;', '&' . ltrim($args, '&'));
        }

        foreach ($this->rewrite as $rewrite) {
            $url = $rewrite->rewrite($url);
        }
        return $url;
    }

    public function getUrlDetail($query) {
        global $loader, $registry;
        $loader->model('catalog/seo_url');
        $model = $registry->get('model_catalog_seo_url');

        $result = $model->getUrlKeyword($query);
        return $result;
    }

}
