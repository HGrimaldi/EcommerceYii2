<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\modules\clientes\models\Direcciones $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="direcciones-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'id_cliente')->textInput() ?>

    <?= $form->field($model, 'contacto')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'teléfono')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'dirección')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'id_municipio')->textInput() ?>

    <?= $form->field($model, 'id_departamento')->textInput() ?>

    <?= $form->field($model, 'principal')->textInput() ?>

    <?= $form->field($model, 'fecha_ing')->textInput() ?>

    <?= $form->field($model, 'id_usuario_ing')->textInput() ?>

    <?= $form->field($model, 'fecha_mod')->textInput() ?>

    <?= $form->field($model, 'id_usuario_mod')->textInput() ?>

    <?= $form->field($model, 'estado')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
