<?php

use app\modules\productos\models\Productos;
use kartik\form\ActiveForm;
use kartik\grid\GridView;
use kartik\widgets\Select2;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
//use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\modules\compras\models\DetCompras $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="row">
    <div class="col-md-8">
        <div class="card card-outline card-dark">
            <div class="card-header">
                <h3 class="card-title">Datos de compra</h3>
            </div>
            <div class="card-body">
                <table class="table table-sm table-striped table-hover table-bordered">
                <tr>
                    <td width="20%"><b>Id</b></td>
                    <td width="30%"><span class="badge bg-purple">
                    <?= $compra->id_compras?></span></td> 
                    <td width="20%"><b>Codigo</b></td>  
                    <td width="30%"><span class="badge bg-purple">
                    <?= $compra->codigo?></span></td> 
                </tr>
                <tr>
                    <td><b>Numero de factura</b></td>
                    <td><?= $compra->num_factura?></td>
                    <td><b>Proveedor</b></td>
                    <td><?= $compra->proveedor->nombre?></td>
                </tr>
                <tr>
                    <td><b>Fecha</b></td>
                    <td><?= $compra->fecha?></td>
                    <td><b>Tipo de compras</b></td>
                    <td><span class="badge bg-<?= $compra->estado == 0?"warning"
                    : "red";?>"><?= $compra->estado == 0? "Sin procesar":
                    "Procesada";?></span></td>
                </tr>
                <tr>
                    <td><b>Comentarios</b></td>
                    <td colspan="3"><?= nl2br($compra->comentario)?></td>
                </tr>
                </table>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card card-outline card-dark">
            <div class="card-body">
                <h1>Total: <?php echo /*round($total, 2)*/ '$2000'?></h1>
            </div>
        </div>
    </div>
</div>

<!--Formualrio de ingreso-->
<div class="row">
    <div class="col-md-12">
            <div class="card card-dark">
                <div class="card-header">
                    <h3 class="card-title"><i class="fa fa-edit"></i>Agregar detalle a compras</h3>
                    </div>
                    <?php $form = ActiveForm::begin(['id' => 'crear-form'], ['options' => 
                    ['enctype' => 'multipart/form-data']]); ?>
                <div class="card-body">
                    <form role="form">
                    <div class="row">
                        <div class="col-md-6">
                            <?= Html::activeLabel($model, 'id_producto', ['class' => 'control-label']) ?>
                            <?= $form->field($model, 'id_producto', ['showLabels' => false])->widget(Select2::class, [
                                    'data' => ArrayHelper::map(Productos::find()->all(),'id_producto','nombre'),
                                    'options' => ['placeholder' => '-Seleccionar producto'],
                                    'pluginOptions' => ['allowClear' => true],
                                ]); ?>
                        </div>
                        <div class="col-md-6">
                            <?= Html::activeLabel($model, 'cantidad', ['class' => '¨form-label']) ?>
                            <?= $form->field($model, 'cantidad', ['showLabels' => false])->textInput(['type' => 'number']) ?>
                        </div>
                        
                        <div class="col-md-6">
                            <?= Html::activeLabel($model, 'costo', ['class' => '¨control-label']) ?>
                            <?= $form->field($model, 'costo', ['showLabels' => false, 'addon' => ['preped' => ['content' =>
                            '<span>$</span>'], ]])->textInput(['type' => 'number', 'step' => '0.01']); ?>
                        </div>
                        <div class="col-md-6">
                            <?= Html::activeLabel($model, 'descuento', ['class' => '¨control-label']) ?>
                            <?= $form->field($model, 'descuento', ['showLabels' => false, 'addon' => ['preped' => ['content' =>
                            '<span>$</span>'], ]])->textInput(['value' => '0.00', 'type' => 'number', 'step' => '0.01']); ?>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <?= Html::submitButton(
                        $model->isNewRecord ? '<i class="fa fa-save"></i> Guardar' : '<i class="fa fa-save"></i> Actualizar',
                        ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']
                    ) ?>
                    <?= Html::a('<i class="fa fa-ban"></i> Cancelar', ['index'], ['class' => 'btn btn-danger']) ?>
                </div>

            </div>
            </form>
        <?php ActiveForm::end(); ?>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="tbl-sub-categorias-index">

            <?php
                $gridColumns = [
                    [
                        'class' => 'kartik\grid\SerialColumn',
                        'contentOptions' => ['class' => 'kartik-sheet-style'],
                        'width' => '36px',
                        'header' => '#',
                        'headerOptions' => ['class' => 'kartik-sheet-style']
                    ],
                    [
                        'class' => 'kartik\grid\DataColumn',
                        'attribute' => 'id_producto',
                        'vAlign' => 'middle',
                        'format' => 'html',
                        'value' => function ($model) {
                           return $model->producto->nombre;
                        },
                        'filter' => false,
                    ],
                    [
                        'class' => 'kartik\grid\DataColumn',
                        'attribute' => 'cantidad',
                        'width' => '250px',
                        'vAlign' => 'middle',
                        'format' => 'html',
                    ],
                    [
                        'class' => 'kartik\grid\DataColumn',
                        'attribute' => 'costo',
                        'width' => '250px',
                        'vAlign' => 'middle',
                        'format' => 'html',
                    ],
                    [
                        'class' => 'kartik\grid\DataColumn',
                        'attribute' => 'descuento',
                        'width' => '250px',
                        'vAlign' => 'middle',
                        'format' => 'html',
                    ],
                   
                ];

            
                echo GridView::widget([
                    'id' => 'kv-sub-compras',
                    'dataProvider' => $grid,
                    'columns' => $gridColumns,
                    'containerOptions' => ['style' => 'overflow: auto'], // only set when $responsive = false
                    'headerRowOptions' => ['class' => 'kartik-sheet-style'],
                    'filterRowOptions' => ['class' => 'kartik-sheet-style'],
                    'pjax' => true, // pjax is set to always true for this demo
                    // set your toolbar
                    'toolbar' =>  [
                    ],
                    'toggleDataContainer' => ['class' => 'btn-group mr-2'],
                    // set export properties
                    // parameters from the demo form
                    'bordered' => true,
                    'striped' => true,
                    'condensed' => true,
                    'responsive' => true,
                    'hover' => true,
                    //'showPageSummary'=>$pageSummary,
                    'panel' => [
                        'type' => 'dark',
                        'heading' => '',
                    ],
                    'persistResize' => false,
                ]);
            ?>
        </div>
    </div>
</div>