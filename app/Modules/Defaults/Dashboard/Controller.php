<?php

declare(strict_types=1);

namespace App\Modules\Defaults\Dashboard;

use Phalcon\Mvc\Controller as BaseController;
use App\Modules\Defaults\Master\Hakakses\Model as RoleModel;
use Core\Facades\Response;
use Core\Facades\Request;
use Core\Paginator\DataTables\DataTable;
use App\Modules\Defaults\Middleware\Controller as MiddlewareHardController;

/**
 * @routeGroup("/dashboard")
 */
class Controller extends MiddlewareHardController
{
    /**
     * @routeGet("/")
     */
    public function indexAction($id)
    {
        $nama = $this->session->user['nama'];
        $this->view->setVar('user', $nama );
        $tahun = date('Y');
        $this->view->tahun = $this->session->user['tahun'];
        
        $this->view->setVar('module', $id);
        // $this->view->setVar('tahun', $tahun);
        $total_pendapatan = TransaksiModel::query()
            ->columns(['MONTH(created_at) as bulan', 'SUM(total) as total'])
            ->groupBy('bulan')
            ->execute()
            ->toArray();

            $totalPendapatanTahunan = TransaksiModel::query()
            ->columns(['YEAR(created_at) as tahun', 'MONTH(created_at) as bulan', 'MONTHNAME(created_at) as nama_bulan', 'SUM(total) as total'])
            ->where('YEAR(created_at) = YEAR(curdate())')
            ->groupBy('tahun, bulan, nama_bulan')
            ->orderBy('bulan')
            ->execute()
            ->toArray();
        

        $bulan = TransaksiModel::query()
            ->distinct(true)
            ->columns(['MONTHNAME(created_at) as  bulan'])
            ->groupBy('bulan')
            ->execute()
            ->toArray();
        $produk_dibeli = VwModel::query()
            ->distinct(true)
            ->columns(['nama_produk as produk', 'sum(qty) as qty'])
            ->groupBy('produk')
            ->execute()
            ->toArray();

        $produk = VwModel::query()
            ->distinct(true)
            ->columns(['nama_produk as produk'])
            ->groupBy('produk')
            ->execute()
            ->toArray();

            // var_dump($produk);
            // die;
            // $voucher = VoucherModel::query()
            // ->columns(['COUNT(*) as total_aktif'])
            // ->where("status = 'Aktif' ")
            // ->execute()
            // ->toArray();
        


        $this->view->setVars([
            'total_pendapatan' => $total_pendapatan,
            'bulan_pendapatan' => $bulan,
            'produk' => $produk,
            'produk_dibeli' => $produk_dibeli,
            'bulanTahun'=>$totalPendapatanTahunan,
            'tahun' => $tahun,
        ]);
    }

    /**
     * @routeGet("/proyeksi-laba-rugi")
     */
    public function proyeksiLabaRugiAction()
    {
        $tahunSekarang = $this->session->user['tahun'];
        $pdam_id = $this->session->user['pdam_id'];
        $jenis = Request::get("jenis");
        if($jenis == "RKA"){
            $sql = "CALL sp_dashboard_proyeksi_laba_rugi($pdam_id, $tahunSekarang,'RKA')";
        }
        else if($jenis == "RKAP"){
            $sql = "CALL sp_dashboard_proyeksi_laba_rugi($pdam_id, $tahunSekarang,'RKAP')";
        }
        
        $result = $this->db->fetchAll($sql);

        return Response::setJsonContent([
            'data' => $result
        ]);
    }

    /**
     * @routeGet("/jumlah-investasi")
     */
    public function jumlahInvestasiAction()
    {
        $tahunSekarang = $this->session->user['tahun'];
        $pdam_id = $this->session->user['pdam_id'];
        $jenis = Request::get("jenis");
        // var_dump($jenis);exit;
        if($jenis == "RKA"){
            $sql = "CALL sp_dashboard_jumlah_investasi($pdam_id, $tahunSekarang,'RKA')";
        }
        else if($jenis == "RKAP"){
            $sql = "CALL sp_dashboard_jumlah_investasi($pdam_id, $tahunSekarang,'RKAP')";
        }
        
        $result = $this->db->fetchOne($sql);

        return Response::setJsonContent([
            'data' => $result
        ]);
    }

    /**
     * @routeGet("/jumlah-biaya")
     */
    public function jumlahBiayaAction()
    {
        $tahunSekarang = $this->session->user['tahun'];
        $pdam_id = $this->session->user['pdam_id'];
        $jenis = Request::get('jenis');
        if($jenis == "RKA"){
            $sql = "CALL sp_dashboard_jumlah_biaya($pdam_id, $tahunSekarang,'RKA')";
        }
        else if($jenis == "RKAP"){
            $sql = "CALL sp_dashboard_jumlah_biaya($pdam_id, $tahunSekarang,'RKAP')";
        }
        
        $result = $this->db->fetchOne($sql);

        return Response::setJsonContent([
            'data' => $result
        ]);
    }

    /**
     * @routeGet("/jumlah-sl")
     */
    public function jumlahSLAction()
    {
        $tahunSekarang = $this->session->user['tahun'];
        $pdam_id = $this->session->user['pdam_id'];
        $jenis = Request::get('jenis');
        $sql = "CALL sp_dashboard_sl($pdam_id, $tahunSekarang,'$jenis')";
        $result = $this->db->fetchAll($sql);
        return Response::setJsonContent($result);
    }

    /**
     * @routeGet("/data-terverifikasi")
     */
    public function dataTerverifikasiAction()
    {
        $tahunSekarang = $this->session->user['tahun'];
        $pdam_id = $this->session->user['pdam_id'];
        $jenis = Request::get('jenis');
        if($jenis == "RKA"){
            $sql = "CALL sp_dashboard_data_terverifikasi($pdam_id, $tahunSekarang,'RKA')";
        }
        else if($jenis == "RKAP"){
            $sql = "CALL sp_dashboard_data_terverifikasi($pdam_id, $tahunSekarang,'RKAP')";
        }
        
        $result = $this->db->fetchAll($sql);

        return Response::setJsonContent([
            'data' => $result
        ]);
    }

    /**
     * @routeGet("/pendapatan")
     */
    public function pendapatanAction()
    {
        $tahunSekarang = $this->session->user['tahun'];
        $pdam_id = $this->session->user['pdam_id'];
        $jenis = Request::get('jenis');
        if($jenis == "RKA"){
            $sql = "CALL sp_dashboard_pendapatan($pdam_id, $tahunSekarang, 'RKA')";
        }
        else if($jenis == "RKAP"){
            $sql = "CALL sp_dashboard_pendapatan($pdam_id, $tahunSekarang, 'RKAP')";
        }

        $result = $this->db->fetchAll($sql);

        $tmp_header = array();
        $mainData = array();
        foreach ($result as $head) {
            if (!in_array($head['kode_kelompok'], $tmp_header)) {
                $data["total"] = 0;
                $data["kode_kelompok"]  = $head['kode_kelompok'];
                $data["kelompok"]       = $head['kelompok'];
                $data["data"]           = array();
                foreach ($result as $pendapatan) {
                    if($head['kode_kelompok'] == $pendapatan["kode_kelompok"]){
                        array_push($data["data"], $pendapatan);
                        $data["total"]         += $pendapatan['jumlah'];
                    }
                }
                array_push($tmp_header, $head['kode_kelompok']);
                array_push($mainData, $data);
            }
        }
        return Response::setJsonContent($mainData);
    }

    /**
     * @routeGet("/bar-biaya-pendapatan")
     */
    public function barBiayaPendapatanAction()
    {
        $tahunSekarang = $this->session->user['tahun'];
        $pdam_id = $this->session->user['pdam_id'];
        $jenis = Request::get('jenis');
        if($jenis == "RKA"){
            $sql = "CALL sp_dashboard_biaya_pendapatan($pdam_id, $tahunSekarang, 'RKA')";
        }
        else if($jenis == "RKAP"){
            $sql = "CALL sp_dashboard_biaya_pendapatan($pdam_id, $tahunSekarang, 'RKAP')";
        }

        $result = $this->db->fetchAll($sql);

        return Response::setJsonContent([
            'data' => $result
        ]);
    }

    /**
     * @routeGet("/pie-anggaran-biaya-per-satker")
     */
    public function pieAnggaranBiayaPerSatkerAction()
    {
        $tahunSekarang = $this->session->user['tahun'];
        $pdam_id = $this->session->user['pdam_id'];
        $jenis = Request::get('jenis');
        if($jenis == "RKA"){
            $sql = "CALL sp_dashboard_alokasi_anggaran_satker($pdam_id, $tahunSekarang, 'RKA')";
        }
        else if($jenis == "RKAP"){
            $sql = "CALL sp_dashboard_alokasi_anggaran_satker($pdam_id, $tahunSekarang, 'RKAP')";
        }
        $result = $this->db->fetchAll($sql);

        return Response::setJsonContent([
            'data' => $result
        ]);
    }

    /**
     * @routeGet("/estimasi-anggaran-biaya")
     */
    public function estimasiAnggaranBiayaAction()
    {
        $tahunSekarang = $this->session->user['tahun'];
        $pdam_id = $this->session->user['pdam_id'];
        $jenis = Request::get('jenis');
        if($jenis == "RKA"){
            $sql = "CALL sp_dashboard_anggaran_biaya($pdam_id, $tahunSekarang,'RKA')";
        }
        else if($jenis == "RKAP"){
            $sql = "CALL sp_dashboard_anggaran_biaya($pdam_id, $tahunSekarang, 'RKAP')";
        }

        $result = $this->db->fetchAll($sql);

        return Response::setJsonContent([
            'data' => $result
        ]);
    }

    /**
     * @routeGet("/produksi-distribusi")
     */
    public function produksiDistribusiAction()
    {
        $tahunSekarang = $this->session->user['tahun'];
        $pdam_id = $this->session->user['pdam_id'];
        $jenis = Request::get('jenis');
        if($jenis == "RKA"){
            $sql = "CALL sp_dashboard_produksi_distribusi($pdam_id, $tahunSekarang,'RKA')";
        }
        else if($jenis == "RKAP"){
            $sql = "CALL sp_dashboard_produksi_distribusi($pdam_id, $tahunSekarang, 'RKAP')";
        }

        $result = $this->db->fetchOne($sql);

        return Response::setJsonContent([
            'data' => $result
        ]);
    }

    /**
     * @routePost("/produksi-distribusi-bulan")
     */
    public function produksiDistribusiBulanAction()
    {
        $tahunSekarang = $this->session->user['tahun'];
        $pdam_id = $this->session->user['pdam_id'];
        $bulan = Request::getPost('bulan');
        $jenis = Request::getPost('jenis');
        if($jenis == "RKA"){
            $sql = "CALL sp_dashboard_produksi_distribusi_bulan($pdam_id, $tahunSekarang, $bulan,'RKA')";
        }
        else if($jenis == "RKAP"){
            $sql = "CALL sp_dashboard_produksi_distribusi_bulan($pdam_id, $tahunSekarang, $bulan,'RKAP')";
        }

        $result = $this->db->fetchOne($sql);

        return Response::setJsonContent([
            'data' => $result
        ]);
    }

    /**
     * @routePost("/arus-kas-tahun")
     */
    public function arusKasTahunAction()
    {
        $tahunSekarang = $this->session->user['tahun'];
        $pdam_id = $this->session->user['pdam_id'];
        $bulan = Request::getPost('bulan');
        $jenis = Request::get('jenis');

        if($jenis == "RKA"){
            $sql = "CALL sp_dashboard_arus_kas_tahun($tahunSekarang, $pdam_id,'RKA')";
        }
        else if($jenis == "RKAP"){
            $sql = "CALL sp_dashboard_arus_kas_tahun($tahunSekarang, $pdam_id,'RKAP')";
        }
       
        $result = $this->db->fetchOne($sql);

        return Response::setJsonContent([
            'data' => $result
        ]);
    }

    /**
     * @routePost("/arus-kas-bulan")
     */
    public function arusKasBulanAction()
    {
        $tahunSekarang = $this->session->user['tahun'];
        $pdam_id = $this->session->user['pdam_id'];
        $bulan = Request::getPost('bulan');
        $jenis = Request::getPost('jenis');

        if($jenis == "RKA"){
            $sql = "CALL sp_dashboard_arus_kas_bulan($tahunSekarang, $pdam_id, $bulan, 'RKA')";
        }
        else if($jenis == "RKAP"){
            $sql = "CALL sp_dashboard_arus_kas_bulan($tahunSekarang, $pdam_id, $bulan, 'RKAP')";
        }

        $result = $this->db->fetchOne($sql);
        // var_dump($result["penerimaan_kas"]);exit;
        return Response::setJsonContent([
            'data' => $result
        ]);
    }

    
    /**
     * @routeGet("/datatable")
     * @routePost("/datatable")
     */
    public function datatableAction()
    {
        // var_dump(Request::getPost());exit;
        $pdam_id = $this->session->user['pdam_id'];
        
        $builder = $this->modelsManager->createBuilder()
                        ->columns('*')
                        ->from(VwTransaksiModel::class)
                        ->where("1=1")
                        ->andWhere("DATE(created_at) = CURDATE() and pdam_id = '$pdam_id'");


        
        $dataTables = new DataTable();
        $dataTables->fromBuilder($builder)->sendResponse();

        // var_dump($dataTables);
        // die;
        
        
    }
    /**
     * @routeGet("/voucherAktif")
     */
    public function getJumlahTersediaAction()
    {
        $this->view->disable();
        $tanggal = date('Y-m-d');
        $select = "SELECT COUNT(*) AS rowcount FROM vw_voucher WHERE status COLLATE utf8mb4_general_ci = 'Aktif' COLLATE utf8mb4_general_ci;";
        $result = $this->db->fetchAll($select);
    
        if (!empty($result)) {
            // Mengakses nilai 'rowcount' dari hasil fetchAll
            $jumlahTersedia = $result[0]['rowcount'];
            echo $jumlahTersedia;
        } else {
            echo "Data tidak ditemukan";
        }
    }
    

/**
     * @routeGet("/transaksiHari")
     */
    public function getJumlahTransaksiHariAction()
{
    $this->view->disable();
    
        $select = "SELECT COUNT(*) AS rowcount FROM transaksi WHERE date(created_at) = CURDATE();";
        $result = $this->db->fetchAll($select);
    
        if (!empty($result)) {
            // Mengakses nilai 'rowcount' dari hasil fetchAll
            $jumlahTersedia = $result[0]['rowcount'];
            echo $jumlahTersedia;
        } else {
            echo "Data tidak ditemukan";
        }
}

/**
     * @routeGet("/pendapatanBulanan")
     */
    public function getPendapatanBulananAction()
{
    $this->view->disable();
    
        $select = "SELECT 
        SUM(total) AS total  
    FROM 
        transaksi 
    WHERE 
        MONTH(created_at) = MONTH(CURDATE()) AND YEAR(created_at) = YEAR(CURDATE())
    GROUP BY 
        YEAR(created_at),
        MONTH(created_at);
    ";
        $result = $this->db->fetchAll($select);
    
        if (!empty($result)) {
            // Mengakses nilai 'rowcount' dari hasil fetchAll
            $jumlahTersedia = $result[0]['total'];
            echo $jumlahTersedia;
            
        } else {
            echo "Data tidak ditemukan";
        }
}

/**
     * @routeGet("/pendapatanHarian")
     */
    public function getPendapatanHarianAction()
{
    $this->view->disable();
    
        $select = "SELECT 
        
        SUM(total) AS total  
    FROM 
        transaksi 
    WHERE 
        DATE(created_at) = DATE(CURDATE())
    GROUP BY 
        DATE(created_at);
    ";
        $result = $this->db->fetchAll($select);
    
        if (!empty($result)) {
            // Mengakses nilai 'rowcount' dari hasil fetchAll
            $jumlahTersedia = $result[0]['total'];
            echo $jumlahTersedia;
            
        } else {
            echo "Data tidak ditemukan";
        }
}

/**
     * @routeGet("/transaksiBulanan")
     */
    public function getTransaksiBulananAction()
{
    $this->view->disable();
    
        $select = "SELECT COUNT(*) AS total FROM transaksi WHERE month(created_at) = month(CURDATE());";
        $result = $this->db->fetchAll($select);
    
        if (!empty($result)) {
            // Mengakses nilai 'rowcount' dari hasil fetchAll
            $jumlahTersedia = $result[0]['total'];
            echo $jumlahTersedia;
        } else {
            echo "Data tidak ditemukan";
        }
}

/**
     * @routeGet("/transaksiHarian")
     */
    public function getTransaksiHarianAction()
{
    $this->view->disable();
    
        $select = "SELECT COUNT(*) AS total FROM transaksi WHERE date(created_at) = date(CURDATE());";
        $result = $this->db->fetchAll($select);
    
        if (!empty($result)) {
            // Mengakses nilai 'rowcount' dari hasil fetchAll
            $jumlahTersedia = $result[0]['total'];
            echo $jumlahTersedia;
        } else {
            echo "Data tidak ditemukan";
        }
}

 /**
     * @routeGet("/datatabledetail")
     * @routePost("/datatabledetail")
     */
    public function datatabledetailAction()
    {
        $pdam_id = $this->session->user['pdam_id'];
        $detail = $this->request->getPost("id"); // Ambil diFilter dari permintaan POST
        $builder = $this->modelsManager->createBuilder()
        ->columns('*')
        ->from(VwModel::class)
        ->where("1=1")
        ->andWhere(" trans_id ='$detail' and pdam_id = '$pdam_id'");




$dataTables = new DataTable();
$dataTables->fromBuilder($builder)->sendResponse();

    }

     /**
     * @routePost("/delete")
     */
    public function deleteAction()
    {
        $id = Request::get('id');
        $data = [
            'id'            => Request::get('id')
        ];
        $delete = TransaksiModel::findFirst($id);

        $result = $delete->delete();

        $log = new Log(); 
        $log->write("Delete Data Master-Referensi Barang-Barang", $data, $result, "App\Modules\Defaults\Master\ReferensiBarang\Barang\Controller", "DELETE");

        return Response::setJsonContent([
            'message' => 'Success',
        ]);
    }
    
    
    

    }
    

