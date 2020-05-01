<?php
/**
 * @package     OpenCart
 * @author      PG
 * @copyright   Copyright (c) 2018, PG Services Pvt Ltd.
 * @license     https://opensource.org/licenses/GPL-3.0
 * @link        https://www.pg.com
 */

/**
 * Model for PG module
 */
class ModelExtensionPaymentPG extends Model {
    public function getMethod($address, $total) {
        $this->load->language('extension/payment/pg');

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('payment_pg_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");

        if ($this->config->get('payment_pg_total') > 0 && $this->config->get('payment_pg_total') > $total) {
            $status = false;
        } elseif (!$this->config->get('payment_pg_geo_zone_id')) {
            $status = true;
        } elseif ($query->num_rows) {
            $status = true;
        } else {
            $status = false;
        }

        $currencies = array(
            'AUD',
            'USD',
            'INR',
        );

        if (!in_array(strtoupper($this->session->data['currency']), $currencies)) {
            $status = false;
        }

        $method_data = array();

        if ($status) {
            $method_data = array(
                'code'       => 'pg',
                'title'      => $this->language->get('text_title'),
                'terms'      => '',
                'sort_order' => $this->config->get('payment_pg_sort_order')
            );
        }

        return $method_data;
    }
}
