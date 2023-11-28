<?php

declare(strict_types=1);

namespace App\Modules\Defaults\Laporan;

use App\Libraries\Log;
use Phalcon\Mvc\Controller as BaseController;
use App\Modules\Defaults\Master\Hakakses\Model as RoleModel;
use Core\Facades\Response;
use App\Modules\Defaults\Middleware\Controller as MiddlewareHardController;
use Core\Facades\Request;
use Core\Paginator\DataTables\DataTable;


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
        $filter_kasir = Request::getPost('kasir');
        $nama = Request::getPost('nama_kasir');
        $filter_from = Request::getPost('date_from');
        $filter_until = Request::getPost('date_until');
        $filter_transaksi = Request::getPost('transaksi');
        
        $builder = $this->modelsManager->createBuilder()
                        ->columns('*')
                        ->from(VwTransaksiModel::class)
                        ->where("1=1")
                        ->andWhere("pdam_id = '$pdam_id'");


        if($filter_transaksi) {
            $builder->andWhere("trans_id = $filter_transaksi");
        }
        
        if($filter_from == $filter_until && $filter_from !== null && $filter_until !== null  ){
            $builder->andWhere("tanggal = $filter_from ");
        }elseif($filter_from && $filter_until)  {
            $builder->andWhere("tanggal BETWEEN :from: AND :until:", ['from' => $filter_from, 'until' => $filter_until]);        
        }elseif($filter_from) {
            $builder->andWhere("tanggal = $filter_from ");
        }elseif($filter_until) {
            $builder->andWhere("tanggal = $filter_until ");
        }
        
        if($filter_kasir) {
            $builder->andWhere("kode_kasir = '$filter_kasir' ");
        }
        

        $dataTables = new DataTable();
        $dataTables->fromBuilder($builder)->sendResponse();

        // var_dump($dataTables);
        // die;
        
        
    }

    /**
     * @routeGet("/detail")
     */
    public function detailAction()
    {

    }

    /**
     * @routeGet("/laporanPdf")
     * @routePost("/laporanPdf")
     */
    public function laporanPdfAction($id)
    {
        
        $pdam_id = $this->session->user['pdam_id'];
        $filter_kasir = Request::get('kasir');
        if(($filter_kasir != 0)||($filter_kasir != '')){
            $nama = Request::get('nama_kasir');
        }else{
            $nama = '';
        }
        $filter_from = Request::get('date_from');
        $filter_until = Request::get('date_until');
        $filter_transaksi = Request::get('transaksi');
        
        
        // var_dump( $filter_from, $filter_until);
        // die;
        
        $builder = $this->modelsManager->createBuilder()
                        ->columns('*')
                        ->from(VwtransModel::class)
                        ->where("1=1")
                        ->andWhere("pdam_id = '$pdam_id'");


        if($filter_transaksi) {
            $builder->andWhere("trans_id = $filter_transaksi");
        }
        
        if($filter_kasir) {
            $builder->andWhere("kode_kasir LIKE '%$filter_kasir%'");
        }
        
        if($filter_from == $filter_until && $filter_from !== null && $filter_until !== null  ){
            $builder->andWhere("tanggal = $filter_from ");
        }elseif($filter_from && $filter_until)  {
            $builder->andWhere("tanggal BETWEEN :from: AND :until:", ['from' => $filter_from, 'until' => $filter_until]);        
        }elseif($filter_from) {
            $builder->andWhere("tanggal = $filter_from ");
        }elseif($filter_until) {
            $builder->andWhere("tanggal = $filter_until ");
        }
        

        $result = $builder->getQuery()->execute();

        $this->view->setVar('module', $id);
        
        $this->view->setVar('dari', $filter_from);
        $this->view->setVar('sampai', $filter_until);
        $this->view->setVar('nama_kasir', $nama);
        $this->view->setVar('result', $result->toArray());
        $jsonResult = [
            'message' => 'Aksi datacardAction berhasil dipanggil.',
            'data' => $result->toArray(),
        ];

        
    }
   
}