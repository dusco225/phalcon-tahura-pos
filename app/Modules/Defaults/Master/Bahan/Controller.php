<?php
//Controller.php
declare(strict_types=1);

namespace App\Modules\Defaults\Master\Bahan;

use App\Libraries\Log;
use Phalcon\Mvc\Controller as BaseController;
use App\Modules\Defaults\Master\Hakakses\Model as RoleModel;
use Core\Facades\Response;
use App\Modules\Defaults\Middleware\Controller as MiddlewareHardController;
use Core\Facades\Request;
use Core\Paginator\DataTables\DataTable;
use App\Modules\Defaults\Master\Bahan\Model as Model;

/**
 * @routeGroup("/master/bahan")
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
                        ->where("1=1")
                        ->andWhere("pdam_id = '$pdam_id'");

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
        $sessUser = $this->session->user['nama'];
        
        $data = [
            'nama'          => Request::getPost('nama'),
            'jumlah'        => Request::getPost('jumlah'),
            'satuan_id'        => Request::getPost('satuan'),
            'harga'         => Request::getPost('harga'),
            'created_at'    => date ('Y-m-d H:i:s'),
            'pdam_id'       => $pdam_id,
        ];
        $create = new Model($data);
        $result = $create->save();

        $log = new Log(); 
        $log->write("Insert Data Master-Referensi Barang-Kategori", $data, $result, "App\Modules\Defaults\Master\ReferensiBarang\Kategori\Controller", "INSERT");
        return Response::setJsonContent([
            'message' => 'Success',
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
            'jumlah'          => Request::getPost('jumlah'),
            'satuan_id'        => Request::getPost('satuan'),
            'harga'         => Request::getPost('harga'),
            'updated_at'    => date('Y-m-d H:i:s'),
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