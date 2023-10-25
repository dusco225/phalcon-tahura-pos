SELECT 
 	item.transaksi_id AS trans_id,
	SUM(item.jumlah * produk.harga_jual) AS total_produk_dibeli,
	master_kasir.nama AS nama_kasir

FROM 
  `transaksi_detail` `item`
        LEFT JOIN `master_produk` `produk` ON (`produk`.`id` = `item`.`produk_id`)
        LEFT JOIN `transaksi` `trans` ON (`trans`.`id` = `item`.`transaksi_id`)
        LEFT JOIN `master_kasir`ON (`master_kasir`.`id` = `trans`.`kasir_id`)
        
WHERE 1
GROUP BY item.transaksi_id,master_kasir.nama
; 
