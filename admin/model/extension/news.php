<?php
class ModelExtensionNews extends Model {
	public function addNews($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "news SET image = '" . $this->db->escape($data['image']) . "', date_added = NOW(), status = '" . (int)$data['status'] . "'");
		
		$news_id = $this->db->getLastId();
		
		foreach ($data['news'] as $key => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX ."news_description SET news_id = '" . (int)$news_id . "', language_id = '" . (int)$key . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "', short_description = '" . $this->db->escape($value['short_description']) . "'");
		}
		
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'news_id=" . (int)$news_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

        if ($data['meta-keyword'] || $data['meta-title'] || $data['meta-h1'] || $data['meta-description']){
            $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_meta WHERE news_id = '" . (int)$news_id . "'");
            if ($query->num_rows == 0){
                $this->db->query("INSERT INTO " . DB_PREFIX . "news_meta SET news_id = '" . (int)$news_id . "'");
            }

        }

        if ($data['meta-keyword']) {
            $this->db->query("UPDATE " . DB_PREFIX . "news_meta SET meta_keyword = '" . $data['meta-keyword'] . "' WHERE news_id = '" . (int)$news_id . "'");
        }

        if ($data['meta-title']) {
            $this->db->query("UPDATE " . DB_PREFIX . "news_meta SET meta_title = '" . $data['meta-title'] . "' WHERE news_id = '" . (int)$news_id . "'");
        }

        if ($data['meta-h1']) {
            $this->db->query("UPDATE " . DB_PREFIX . "news_meta SET meta_h1 = '" . $data['meta-h1'] . "' WHERE news_id = '" . (int)$news_id . "'");
        }

        if ($data['meta-description']) {
            $this->db->query("UPDATE " . DB_PREFIX . "news_meta SET meta_description = '" . $data['meta-description'] . "' WHERE news_id = '" . (int)$news_id . "'");
        }
	}
	
	public function editNews($news_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "news SET image = '" . $this->db->escape($data['image']) . "', status = '" . (int)$data['status'] . "' WHERE news_id = '" . (int)$news_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "news_description WHERE news_id = '" . (int)$news_id. "'");
		
		foreach ($data['news'] as $key => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX ."news_description SET news_id = '" . (int)$news_id . "', language_id = '" . (int)$key . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "', short_description = '" . $this->db->escape($value['short_description']) . "'");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'news_id=" . (int)$news_id. "'");
		
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'news_id=" . (int)$news_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		if ($data['meta-keyword'] || $data['meta-title'] || $data['meta-h1'] || $data['meta-description']){
		    $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_meta WHERE news_id = '" . (int)$news_id . "'");
		    if ($query->num_rows == 0){
		        $this->db->query("INSERT INTO " . DB_PREFIX . "news_meta SET news_id = '" . (int)$news_id . "'");
            }

        }

		if ($data['meta-keyword']) {
            $this->db->query("UPDATE " . DB_PREFIX . "news_meta SET meta_keyword = '" . $data['meta-keyword'] . "' WHERE news_id = '" . (int)$news_id . "'");
        }

        if ($data['meta-title']) {
            $this->db->query("UPDATE " . DB_PREFIX . "news_meta SET meta_title = '" . $data['meta-title'] . "' WHERE news_id = '" . (int)$news_id . "'");
        }

        if ($data['meta-h1']) {
            $this->db->query("UPDATE " . DB_PREFIX . "news_meta SET meta_h1 = '" . $data['meta-h1'] . "' WHERE news_id = '" . (int)$news_id . "'");
        }

        if ($data['meta-description']) {
            $this->db->query("UPDATE " . DB_PREFIX . "news_meta SET meta_description = '" . $data['meta-description'] . "' WHERE news_id = '" . (int)$news_id . "'");
        }
	}
	
	public function getNews($news_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'news_id=" . (int)$news_id . "') AS keyword FROM " . DB_PREFIX . "news WHERE news_id = '" . (int)$news_id . "'"); 
 
		if ($query->num_rows) {
			return $query->row;
		} else {
			return false;
		}
	}

	public function getNewsMeta($news_id)
    {
	    $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_meta WHERE news_id = " . (int)$news_id);
	    return $query->row;
    }
   
	public function getNewsDescription($news_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "news_description WHERE news_id = '" . (int)$news_id . "'"); 
		
		foreach ($query->rows as $result) {
			$news_description[$result['language_id']] = array(
				'title'       			=> $result['title'],
				'short_description'		=> $result['short_description'],
				'description' 			=> $result['description']
			);
		}
		
		return $news_description;
	}
 
	public function getAllNews($data) {
		$sql = "SELECT * FROM " . DB_PREFIX . "news n LEFT JOIN " . DB_PREFIX . "news_description nd ON n.news_id = nd.news_id WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY date_added DESC";
		
		if (isset($data['start']) && isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}
			
			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	
		
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}	
		
		$query = $this->db->query($sql);
 
		return $query->rows;
	}
   
	public function deleteNews($news_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "news WHERE news_id = '" . (int)$news_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "news_description WHERE news_id = '" . (int)$news_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'news_id=" . (int)$news_id. "'");
	}
   
	public function getTotalNews() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "news");
	
		return $query->row['total'];
	}
}