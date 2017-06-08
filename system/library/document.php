<?php
class Document {
	private $title;
	private $description;
	private $keywords;
	private $links = array();
	private $styles = array();
	private $scripts = array();
	private $headScripts = array();
	private $asyncScripts = array();

	public function setTitle($title) {
		$this->title = $title;
	}

	public function getTitle() {
		return $this->title;
	}

	public function setDescription($description) {
		$this->description = $description;
	}

	public function getDescription() {
		return $this->description;
	}

	public function setKeywords($keywords) {
		$this->keywords = $keywords;
	}

	public function getKeywords() {
		return $this->keywords;
	}

	public function addLink($href, $rel) {
    /* Удаление из массива links элементов, которые соответствуют определенным атрибутам rel */
    $strippedRels = array('canonical'); // пока только canonical
    $stripLinksByRel = function($rel){
      return array_filter($this->links,function($link) use($rel){
        return $link['rel'] != $rel;
      });
    };

    // Запускаем удаление только если в rel аргументе указан один из удаляемых rel-ов
    if (in_array($rel, $strippedRels)) {
      $this->links = $stripLinksByRel($rel);
    }

		$this->links[$href] = array(
			'href' => $href,
			'rel'  => $rel
		);
	}

	public function getLinks() {
		return $this->links;
	}

	public function addStyle($href, $rel = 'stylesheet', $media = 'screen') {
		$this->styles[$href] = array(
			'href'  => $href,
			'rel'   => $rel,
			'media' => $media
		);
	}

	public function getStyles() {
		return $this->styles;
	}

	public function addScript($script, $async = false) {
    $hash = md5($script);
    $this->scripts[$hash] = $script;
    if ($async){
      $this->asyncScripts[] = $hash;
    }
	}

	public function getScripts() {
		return $this->scripts;
	}

  public function addHeadScript($script, $async = false) {
    $hash = md5($script);
		$this->headScripts[$hash] = $script;
    if ($async){
      $this->asyncScripts[] = $hash;
    }
	}

	public function getHeadScripts() {
		return $this->headScripts;
	}

  public function isAsync($script){
    return in_array(md5($script), $this->asyncScripts);
  }

  public function getCanonical() {
    foreach ($this->links as $link) {
      if ($link['rel'] == 'canonical') {
        return $link['href'];
      }
    }

    return FALSE;
  }
}