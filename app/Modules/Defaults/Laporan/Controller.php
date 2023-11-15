<?php
//Controller.php
declare(strict_types=1);

namespace App\Modules\Defaults\Laporan;

use App\Libraries\Log;
use Phalcon\Mvc\Controller as BaseController;
use App\Modules\Defaults\Master\Hakakses\Model as RoleModel;
use Core\Facades\Response;
use App\Modules\Defaults\Middleware\Controller as MiddlewareHardController;
use Core\Facades\Request;
use Core\Paginator\DataTables\DataTable;
use App\Modules\Defaults\Kasir\Model as Model;
use App\Modules\Defaults\Laporan\TransaksiModel as TransaksiModel;
use App\Modules\Defaults\Laporan\TransaksiDetailModel as TransaksiDetailModel;

/**
 * @routeGroup("/laporan")
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



      /**
     * @routeGet("/datatable")
     * @routePost("/datatable")
     */
    public function datatableAction()
    {
        // var_dump(Request::getPost());exit;
        $pdam_id = $this->session->user['pdam_id'];
        $search_nama = Request::getPost('search_nama');
        $search_satuan = Request::getPost('search_satuan');
        
        $builder = $this->modelsManager->createBuilder()
                        ->columns('*')
                        ->from(VwModel::class)
                        ->where("1=1");
                        // ->andWhere("pdam_id = '$pdam_id'");

        if($search_nama) {
            $builder->andWhere("nama LIKE '%$search_nama%'");
        }
        if($search_satuan) {
            $builder->andWhere("id_satuan LIKE '%$search_satuan%'");
        }



        $dataTables = new DataTable();
        $dataTables->fromBuilder($builder)->sendResponse();
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
            ->andWhere("kode = '$voucher_kode' and pdam_id = '$pdam_id'");

        // if ($newFilter) {
        //     $builder->andWhere("nama LIKE '%$newFilter%'");
        // }

        $result = $builder->getQuery()->execute();

        $jsonResult = [
            'message' => 'Aksi datacardAction berhasil dipanggil.',
            'data' => $result->toArray(),
        ];

        return $this->response->setJsonContent($jsonResult);
    }


    /**
     * @routeGet("/strukPdf")
     */
    public function strukPdfAction()
    {
        $struk = request::get('struk');
        // $tanggal = request::get('transaksi_tanggal');
        // $nama = request::get('nama');
        // $kode = request::get('kode');
        // $produk = request::get('produk_data'); //berisi array
        // $kode_voucher = request::get('kode_voucher');
        // $diskon_voucher = request::get('diskon_voucher');
        // $potongan = request::get('potongan_voucher');
        // $total = request::get('total');
        // $tunai = request::get('tunai');
        // $kembali = request::get('kembali');
        // $var = "Ramdani"; 
        // $data = ;

        $this->view->setVar('struk', $struk);
        // return Response::setJsonContent([
        //     'message' => 'Data berhasil disimpan.',
        //     'struk' => $struk, // Anda dapat menambahkan informasi lain yang Anda butuhkan
        // ]);
    }

}
