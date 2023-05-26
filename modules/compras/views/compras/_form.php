<?php

//Yii::$app->lenguage = 'es_ES';

use app\modules\compras\models\Proveedores;
use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use kartik\widgets\ActiveForm;
use kartik\editors\Summernote;
use kartik\widgets\DatePicker;
use kartik\widgets\Select2;
use kartik\widgets\SwitchInput;

/** @var yii\web\View $this */
/** @var app\modules\compras\models\Compras $model */
/** @var yii\widgets\ActiveForm $frorm */


?>
<div class="row">
    <div class="col-md-12">
            <div class="card card-dark">
                <div class="card-header">
                    <h3 class="card-title"><i class="fa fa-edit"></i>Crear / Editar Registro</h3>
                    </div>
                    <?php $form = ActiveForm::begin(['id' => 'crear-form'], ['options' => 
                    ['enctype' => 'multipart/form-data']]); ?>
                <div class="card-body">
                    <form role="form">
                    <div class="row">
                        <div class="col-md-6">
                            <?= Html::activeLabel($model, 'num_factura', ['class' => '¨form-label']) ?>
                            <?= $form->field($model, 'num_factura', ['showLabels' => false])->textInput() ?>
                        </div>
                        <div class="col-md-6">
                            <?= Html::activeLabel($model, 'id_proveedor', ['class' => 'control-label']) ?>
                            <?= $form->field($model, 'id_proveedor', ['showLabels' => false])->widget(Select2::class, [
                                    'data' => ArrayHelper::map(
                                        Proveedores::find()->all(),
                                        'id_proveedor',
                                        'nombre'
                                    ),
                                    'options' => ['placeholder' => '-Seleccionar Proveedor-'],
                                    'pluginOptions' => ['allowClear' => true],
                                ]); ?>
                        </div>
                        <div class="col-md-6">
                            <?= Html::activeLabel($model, 'fecha', ['class' => '¨form-label']) ?>
                            <?= $form->field($model, 'fecha', ['showLabels' => false])->widget(DatePicker::class, [
                                'options' => ['placeholder' => 'Seleccionar rango de fecha...'],
                                'pluginOptions' => [
                                    'autoclose' => true, 'format' => 'yyyy-m-dd',
                                    'todayHighlight' => true
                                ],
                            ]) ?>
                        </div>
                        <div class="col-md-6">
                            <?= Html::activeLabel($model, 'tipo_compra', ['class' => '¨form-label']) ?>
                            <?= $form->field($model, 'tipo_compra', ['showLabels' => false])->radioList(
                                [0 => 'Contado', 1 => 'Credito'],
                                ['custom' => true, 'inline' => true, 'id' => 'custom-checkbox-list-inline']
                            ) ?>
                        </div>
                        <div class="col-md-12">
                            <?= Html::activeLabel($model, 'comentario', ['class' => '¨form-label']) ?>
                            <?= $form->field($model, 'comentario', ['showLabels' => false])->widget(Summernote::class, [
                                'useKrajeePresets' => false,
                                'container' => [
                                    'class' => 'kv-editor-container'
                                ],
                                'pluginOptions' => [
                                    'height' => 200,
                                    'dialogsFade' => true,
                                    'toolbar' => [
                                        ['style1', ['style']],
                                        ['style2', ['bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript']],
                                        ['font', ['fontname', 'fontsize', 'color', 'clear']],
                                        ['para', ['ul', 'ol', 'paragraph']],
                                        ['insert', ['link', 'table', 'hr']],
                                    ],
                                    'fontSizes' => ['8', '9', '10', '11', '12', '13', '14', '16', '18', '20', '24', '36', '48'],
                                    'placeholder' => 'Escribe la descripción del producto'
                                ]
                            ]) ?>
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