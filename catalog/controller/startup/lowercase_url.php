<?php

class ControllerStartupLowercaseUrl extends Controller
{
    public function index()
    {
        $url = $this->request->get['_route_'];

        if($url != strtolower($url)){
            header('Location: http://'.$_SERVER['HTTP_HOST'] .
               '/'. strtolower($url), true, 301);
            exit();
        }
    }

}