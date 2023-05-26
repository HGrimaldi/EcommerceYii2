<?php

Yii::$app->language = 'es_ES';
use yii\helpers\Html;



/** @var yii\web\View $this */
/** @var app\models\Marcas $model */

$this->title = 'Detalle';
$this->params['breadcrumbs'][] = ['label' => 'Listado de Productos', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="productos-view">

    <div class="row">
        <div class="col-md-12">
            <div class="card card-dark">
                <div class="card-header">
                    <h4 class="card-title">
                        <i class="fa fa-list"></i>
                        <?=$model->nombre?>
                    </h4>
                </div>

                <div class="table-responsive">
                    <table class="table table-striped table-bordered">
                        <tr>
                            <td width="15%"><b>Id:</b></td>
                            <td width="85%"><span class="badge bg-purple"><?= $model->id_proveedor?></span></td>
                        </tr>
                        <tr>
                            <th>Nombre:</th>
                            <td><?=$model->nombre?></td>
                        </tr>
                        <tr>
                            <th>Codigo:</th>
                            <td>
                                <span class="badge bg-info">
                                    <?=$model->codigo?></span>
                            </td>
                        </tr>
                        <tr>
                            <th>Descripcion:</th>
                            <td>
                                <span class="badge bg-info">
                                    <?=$model->descripcion?></span>
                            </td>
                        </tr>
                        <tr>
                            <th>Departamento:</th>
                            <td>
                                <span class="badge bg-blue"><?=$model->departamento->nombre?></span>
                            </td>
                        </tr>
                        <tr>
                            <th>Municipio:</th>
                            <td>
                                <span class="badge bg-black"><?=$model->municipio->nombre?></span>
                            </td>
                        </tr>
                        <tr>
                            <th>Telefono:</th>
                            <td>
                                <span class="badge bg-info">
                                    <?=$model->telefono?></span>
                            </td>
                        </tr>
                        <tr>
                            <th>email:</th>
                            <td>
                                <span class="badge bg-info">
                                    <?=Html::mailto($model->email)?></span>
                            </td>
                        </tr>
                        <tr>
                            <th>Fecha de Creación:</th>
                            <td><?=date('d-m-Y H:m:i', strtotime($model->fecha_ing))?></td>
                        </tr>
                        <tr>
                            <th>Creado por:</th>
                            <td><?=$model->usuarioIng->nombreCompleto?></td>
                        </tr>
                        <tr>
                            <th>Fecha de Modificación:</th>
                            <td><?=date('d-m-Y H:m:i', strtotime($model->fecha_mod))?></td>
                        </tr>
                        <tr>
                            <th>Actualizado por:</th>
                            <td><?=$model->usuarioMod->nombreCompleto?></td>
                        </tr>
                        <tr>
                            <th>Estado:</th>
                            <td>
                                <span class="badge bg-<?=$model->estado == 1 ? 'green' : 'red'?>">
                                    <?= $model->estado == 1 ? 'Activo' : 'Inactivo' ?>
                                </span>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="card-footer">
                    <?php
                        echo Html::a(
                            '<i class="fa fa-edit"></i> Editar',
                            [
                                'update', 
                                'id_proveedor' => $model->id_proveedor
                            ], 
                            [
                                'class' => 'btn btn-primary',
                                'data-toggle' => 'tooltip',
                                'title' => 'Edit Record'
                            ]
                        );
                    ?>

                    <?php
                        echo Html::a(
                            '<i class="fa fa-undo"></i> Regresar',
                            ['index'], 
                            [
                                'class' => 'btn btn-warning',
                                'data-toggle' => 'tooltip',
                                'title' => 'Regresar'
                            ]
                        );
                    ?>

                    <?php
                        echo Html::a(
                            '<i class="fa fa-trash"></i> Eliminar',
                            [
                                'delete', 
                                'id_proveedor' => $model->id_proveedor
                            ], 
                            [
                                'class' => 'btn btn-danger',
                                'data' => [
                                    'confirm' => 'Esta seguro de querer eliminar este registro?',
                                    'method' => 'post',
                                ],
                            ]
                        );
                    ?>
                </div>
            </div>
        </div>
    </div>
</div>
