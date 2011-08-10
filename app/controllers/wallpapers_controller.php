<?php
class WallpapersController extends AppController {

	var $name = 'Wallpapers';
    var $uses = array('User', 'Group','Used');
    
    function index($id){
        $keywords = $this->params['named']['keywords'];
        $i = 0;
        $page = 1;
        
        $s = $this->getPhotos($keywords, $page);
        $p = $s['photo'][$i];
        
        while($this->inTable($id, $p['id'])){
            if($i < 9){
                $p = $s['photo'][++$i];
            } else {
                $s = $this->getPhotos($keywords, ++$page);
                $i = -1;
            }
        }
        $this->addToTable($id, $p['id']);
        
        $url = "http://farm" . $p['farm'] . ".static.flickr.com/" . $p['server'] . "/" . $p['id'] . "_" . $p['secret'] . ".jpg";
        header('Content-Type: image/jpeg');
        echo file_get_contents($url);
        exit();
    }
    
    function getPhotos($keywords, $page){
        //App::import('Vendor', 'phpflickr');
        include APP_PATH . 'vendors/phpflickr/phpFlickr.php';
        
        $f = new phpFlickr('dc5e210b91a652ee875cd3a1015aa1b1','51d326b3460f5e06');
        $s = $f->photos_search(array(
            'tags'=>$keywords,
            'safe_search'=>3,
            'content_type'=>1,
            'per_page'=>10,
            'page'=>$page,
            'sort'=>'interestingness-desc'
        ));
        return $s;
    }
    
    function InTable($id, $photoId){
        $used = $this->Used->find('first', array('conditions'=>array('user_id'=>$id, 'photo_id'=>$photoId)));
        if(empty($used)){
            return false;
        } else {
            return true;
        }
    }
    function addToTable($id, $photoId){
        $data['user_id'] = $id;
        $data['photo_id'] = $photoId;
        $used = $this->Used->save($data);
    }
}
?>