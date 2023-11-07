<?php
//Controller.php
declare(strict_types=1);

namespace App\Modules\Defaults\Kasir;

use App\Libraries\Log;
use Phalcon\Mvc\Controller as BaseController;
use App\Modules\Defaults\Master\Hakakses\Model as RoleModel;
use Core\Facades\Response;
use App\Modules\Defaults\Middleware\Controller as MiddlewareHardController;
use Core\Facades\Request;
use Core\Paginator\DataTables\DataTable;
use App\Modules\Defaults\Kasir\Model as Model;
use App\Modules\Defaults\Kasir\TransaksiModel as TransaksiModel;
use App\Modules\Defaults\Kasir\TransaksiDetailModel as TransaksiDetailModel;

/**
 * @routeGroup("/kasir")
 */
class Controller extends BaseController
{
    /**
     * @routeGet("/")
     */
    public function indexAction($id)
    {
        $this->view->setVar('module', $id);
    }

    
    //controller.php
    /**
     * @routeGet("/datakategori")
     * @routePost("/datakategori")
     */
    public function datakategoriAction()
    {
        $pdam_id = $this->session->user['pdam_id'];
    
        $builder = $this->modelsManager->createBuilder()
            ->columns('*')
            ->from(KategoriModel::class)
            ->where("1=1")
            ->andWhere("pdam_id = '$pdam_id'");
    
        $result = $builder->getQuery()->execute();
    
        $jsonResult = [
            'message' => 'Aksi DATA KATEGORI berhasil dipanggil.',
            'data'=> $result->toArray(),
        ];
    
        return $this->response->setJsonContent($jsonResult);
    }


    /**
     * @routeGet("/datavoucher")
     * @routePost("/datavoucher")
     */
    public function datavoucherAction()
    {
        $pdam_id = $this->session->user['pdam_id'];
        $voucher_kode = $this->request->getPost("kodeVoucher"); // Ambil diFilter dari permintaan POST
        // $newFilter = $this->request->getPost("newFilter"); // Ambil newFilter dari permintaan POST

        $builder = $this->modelsManager->createBuilder()
            ->columns('*')
            ->from(VoucherModel::class)
            ->where("1=1")
            ->andWhere("pdam_id = '$pdam_id'");

        if ($voucher_kode) {
            $builder->andWhere("kode = '$voucher_kode'");
        }
        // if ($newFilter) {
        //     $builder->andWhere("nama LIKE '%$newFilter%'");
        // }

        $result = $builder->getQuery()->execute();

        $jsonResult = [
            'message' => 'Aksi datacardAction berhasil dipanggil.',
            'data'=> $result->toArray(),
        ];

        return $this->response->setJsonContent($jsonResult);
    }

    /**
     * @routeGet("/datacard")
     * @routePost("/datacard")
     */
    public function datacardAction()
    {
        $pdam_id = $this->session->user['pdam_id'];
        $diFilter = $this->request->getPost("diFilter"); // Ambil diFilter dari permintaan POST
        $newFilter = $this->request->getPost("newFilter"); // Ambil newFilter dari permintaan POST

        $builder = $this->modelsManager->createBuilder()
            ->columns('*')
            ->from(VwModel::class)
            ->where("1=1")
            ->andWhere("pdam_id = '$pdam_id'");

        if ($diFilter) {
            $builder->andWhere("kategori LIKE '%$diFilter%'");
        }
        if ($newFilter) {
            $builder->andWhere("nama LIKE '%$newFilter%'");
        }

        $result = $builder->getQuery()->execute();

        $jsonResult = [
            'message' => 'Aksi datacardAction berhasil dipanggil.',
            'data'=> $result->toArray(),
        ];

        return $this->response->setJsonContent($jsonResult);
    }
    

    /**
     * @routeGet("/datatable")
     * @routePost("/datatable")
     */
    public function datatableAction()
    {
        // var_dump(Request::getPost());exit;
        $pdam_id = $this->session->user['pdam_id'];
        $search_nama = Request::getPost('search_nama');
        $search_kode = Request::getPost('search_kode');
        $kategori_id_search = Request::getPost('kategori_id_search');
        $barang_kategori_id_id = Request::getPost('barang_kategori_id_id');
        $nama_barang = Request::getPost('nama_barang');
        
        $builder = $this->modelsManager->createBuilder()
                        ->columns('*')
                        ->from(VwModel::class)
                        ->where("1=1")
                        ->andWhere("pdam_id = '$pdam_id'");

        if($nama_barang) {
            $builder->andWhere("nama LIKE '%$nama_barang%'");
        }
        if($search_nama) {
            $builder->andWhere("nama LIKE '%$search_nama%'");
        }
        if($search_kode) {
            $builder->andWhere("kode = '$search_kode'");
        }

        if($kategori_id_search) {
            $builder->andWhere("id_kategori = '$kategori_id_search'");
        }
        if($barang_kategori_id_id) {
            $builder->andWhere("id_kategori = '$barang_kategori_id_id   '");
        }



        $dataTables = new DataTable();
        $dataTables->fromBuilder($builder)->sendResponse();
    }


    /**
     * @routePost("/store")
     */
    public function storeAction()
{
    // Ambil data dari permintaan POST
    $kasir = $this->session->user['kasir_kode'];
    $voucher_kode = Request::getPost('voucher_kode');
    $total = Request::getPost('total');
    $produk_data = Request::getPost('produk_data'); // Harus berisi array data produk

    // Simpan data ke tabel 'transaksi'
    $transaksi = new TransaksiModel();
    $transaksi->kode_kasir = $kasir;
    $transaksi->voucher_kode = $voucher_kode;
    $transaksi->total = $total;
    $transaksi->created_at = date('Y-m-d H:i:s');
    $transaksi->save();

    // Ambil ID yang baru saja disimpan
    $transaksi_id = $transaksi->id;

    // Simpan data ke tabel 'transaksi_detail'
    foreach ($produk_data as $produk) {
        $transaksiDetail = new TransaksiDetailModel();
        $transaksiDetail->transaksi_id = $transaksi_id;
        $transaksiDetail->produk_id = $produk['id'];
        $transaksiDetail->qty = $produk['qty'];
        $transaksiDetail->sub_total = $produk['subtotal'];
        $transaksiDetail->save();
    }

    return Response::setJsonContent([
        'message' => 'Data berhasil disimpan.',
        'transaksi_id' => $transaksi_id, // Anda dapat menambahkan informasi lain yang Anda butuhkan
    ]);
}



    
}