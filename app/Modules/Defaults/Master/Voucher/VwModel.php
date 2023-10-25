<?php

declare(strict_types=1);
namespace App\Modules\Defaults\Master\Voucher;

use Phalcon\Mvc\Model as BaseModel;
use Core\Models\Behavior\SoftDelete;
use Phalcon\Mvc\Model\Behavior\Timestampable;

class VwModel extends BaseModel
{
    public function initialize()
    {
        $this->setConnectionService('db');
        $this->setSource('vw_master_voucher');
    }
}