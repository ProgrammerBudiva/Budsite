<?php

class ControllerStartupRedirectCustom extends Controller
{
    public function index()
    {

        $url = $this->request->get['_route_'];

        $parts = explode('/', $url );

        if($parts[0] !== 'admin' & count($parts)>1){
            header("HTTP/1.1 301 Moved Permanently");
            header("Location: /" . $parts[1]);
        }

    }

}