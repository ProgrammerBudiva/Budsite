<?php
class ControllerErrorUnvalidRedirect extends Controller
{
    public function index() {

        $parts = explode('/', $this->request->get['_route_']);
        $this->response->redirect('/' . $parts[0]);

    }
}