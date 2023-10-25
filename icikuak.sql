SELECT
    `item`.`id` AS `id`,
    `item`.`transaksi_id` AS `trans_id`,
    `item`.`produk_id` AS `prod_id`,
    `produk`.`nama` AS `nama_produk`,
    `item`.`jumlah` AS `jumlah_dibeli`,
    `produk`.`harga_jual` AS `harga`,
    `item`.`jumlah` * `produk`.`harga_jual` AS `total`,
    `trans`.`kasir_id` AS `kasir_id`,
    `kasir`.`nama` AS `nama_kasir`
    
    
FROM
        `transaksi_detail` `item`
        LEFT JOIN `master_produk` `produk` ON (`produk`.`id` = `item`.`produk_id`)
        LEFT JOIN `transaksi` `trans` ON (`trans`.`id` = `item`.`transaksi_id`)
        LEFT JOIN `master_kasir` `kasir` ON (`kasir`.`id` = `trans`.`kasir_id`);
        