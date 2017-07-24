<?php

class ControllerStartupRedirectCustom extends Controller
{
    public function index()
    {

        $url = $this->request->get['_route_'];

        $parts = explode('/', $url );

        if(count($parts)>1) {

            //Check if parts[1] is product
            $this->load->model('catalog/seo_url');
            $var = $this->model_catalog_seo_url->getUrlQuery($parts[1]);


            if ($var !== NULL) {

                if ($parts[0] !== 'admin') {
                    header("HTTP/1.1 301 Moved Permanently");
                    header("Location: /" . $parts[1]);
                }

            }

        }

    }

}