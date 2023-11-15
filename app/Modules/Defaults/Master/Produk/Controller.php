<?php
//Controller.php
declare(strict_types=1);

namespace App\Modules\Defaults\Master\Produk;

use App\Libraries\Log;
use Phalcon\Mvc\Controller as BaseController;
use App\Modules\Defaults\Master\Hakakses\Model as RoleModel;
use Core\Facades\Response;
use App\Modules\Defaults\Middleware\Controller as MiddlewareHardController;
use Core\Facades\Request;
use Core\Paginator\DataTables\DataTable;
use App\Modules\Defaults\Master\Produk\ProdukModel as ProdukModel;
use App\Modules\Defaults\Master\Produk\ProDetailModel as ProDetailModel;

/**
 * @routeGroup("/master/produk")
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
     * @routeGet("/strukPdf")
     * @routePost("/strukPdf")
     */
    public function strukPdfAction($id)
    {
        $var = "Ramdani";
        $this->view->setVar('data-nama', $var);
    }

     /**
     * @routeGet("/datauntung")
     * @routePost("/datauntung")
     */
    public function datauntungAction()
    {
        $pdam_id = $this->session->user['pdam_id'];


        $builder = $this->modelsManager->createBuilder()
            ->columns('*')
            ->from(UntungModel::class)
            ->where("1=1")
            ->andWhere("pdam_id = '$pdam_id'");

        

        $result = $builder->getQuery()->execute();

        $jsonResult = [
            'message' => 'Aksi datacardAction berhasil dipanggil.',
            'data' => $result->toArray(),
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
     * @routeGet("/detail")
     */
    public function detailAction()
    {

    }

    /**
     * @routePost("/store")
     */
    public function storeAction()
    {
        $pdam_id = $this->session->user['pdam_id'];
        
        $nama = request::getPost('nama');
        $kategori = request::getPost('kategori');
        $hpp = request::getPost('hpp');
        $harga_jual = request::getPost('harga_jual');
        $bahan_data = request::getPost('bahan_data');

        $this->db->begin();
        //simpan data ke tabel pertama
        $produk = new ProdukModel();
        $produk->nama = $nama;
        $produk->kategori_id = $kategori;
        $produk->hpp = $hpp;
        $produk->harga_jual = $harga_jual;
        $produk->pdam_id = $pdam_id;

        $produk_id = $produk->id;

        foreach($bahan_data as $bahan){
            $produkDetail = new ProDetailModel();
            $produkDetail->produk_id = $produk_id;
            $produkDetail->bahan_id = $bahan['bahan'];
            $produkDetail->jumlah = $bahan['jumlah'];
            $produkDetail->harga = $bahan['harga'];
            $produkDetail->pdam_id = $pdam_id;
        }
        $this->db->commit();
        return Response::setJsonContent([
            'message' => 'Data Terkirim',
            'produk id' => $produk_id,
        ]);
    }

    /**
     * @routePost("/update")
     */
    public function updateAction()
    {
        $id = Request::getPost('id');
        $pdam_id = $this->session->user['pdam_id'];
        $data = [
            'nama'          => Request::getPost('nama'),
            'kategori_id'        => Request::getPost('kategori_id'),
            'hpp'         => Request::getPost('hpp'),
            'pdam_id'       => $pdam_id,
        ];
        $update = Model::findFirst($id);
        $update->assign($data);

        $result = $update->save();
        $log = new Log(); 
        $log->write("Update Data Master-Referensi Barang-Kategori", $data, $result, "App\Modules\Defaults\Master\ReferensiBarang\Kategori\Controller", "UPDATE");
        return Response::setJsonContent([
            'message' => 'Success',
        ]);
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
        $delete = Model::findFirst($id);

        $result = $delete->delete();

        $log = new Log(); 
        $log->write("Delete Data Master-Referensi Barang-Barang", $data, $result, "App\Modules\Defaults\Master\ReferensiBarang\Barang\Controller", "DELETE");

        return Response::setJsonContent([
            'message' => 'Success',
        ]);
    }
    
}