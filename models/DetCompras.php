<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "tbl_det_compras".
 *
 * @property int $id_det_compra
 * @property int $id_compras
 * @property int $id_producto
 * @property int $cantidad
 * @property float $costo
 * @property float $descuento
 * @property string $uuid
 * @property string|null $fecha_ing
 * @property int|null $id_usuario_ing
 * @property string|null $fecha_mod
 * @property int|null $id_usuario_mod
 *
 * @property TblCompras $compras
 * @property TblProductos $producto
 * @property TblUsuarios $usuarioIng
 * @property TblUsuarios $usuarioMod
 */
class DetCompras extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tbl_det_compras';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_compras', 'id_producto', 'cantidad', 'costo', 'descuento', 'uuid'], 'required'],
            [['id_compras', 'id_producto', 'cantidad', 'id_usuario_ing', 'id_usuario_mod'], 'integer'],
            [['costo', 'descuento'], 'number'],
            [['fecha_ing', 'fecha_mod'], 'safe'],
            [['uuid'], 'string', 'max' => 38],
            [['id_compras'], 'exist', 'skipOnError' => true, 'targetClass' => TblCompras::class, 'targetAttribute' => ['id_compras' => 'id_compras']],
            [['id_producto'], 'exist', 'skipOnError' => true, 'targetClass' => TblProductos::class, 'targetAttribute' => ['id_producto' => 'id_producto']],
            [['id_usuario_ing'], 'exist', 'skipOnError' => true, 'targetClass' => TblUsuarios::class, 'targetAttribute' => ['id_usuario_ing' => 'id_usuario']],
            [['id_usuario_mod'], 'exist', 'skipOnError' => true, 'targetClass' => TblUsuarios::class, 'targetAttribute' => ['id_usuario_mod' => 'id_usuario']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_det_compra' => 'Id Det Compra',
            'id_compras' => 'Id Compras',
            'id_producto' => 'Id Producto',
            'cantidad' => 'Cantidad',
            'costo' => 'Costo',
            'descuento' => 'Descuento',
            'uuid' => 'Uuid',
            'fecha_ing' => 'Fecha Ing',
            'id_usuario_ing' => 'Id Usuario Ing',
            'fecha_mod' => 'Fecha Mod',
            'id_usuario_mod' => 'Id Usuario Mod',
        ];
    }

    /**
     * Gets query for [[Compras]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCompras()
    {
        return $this->hasOne(TblCompras::class, ['id_compras' => 'id_compras']);
    }

    /**
     * Gets query for [[Producto]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getProducto()
    {
        return $this->hasOne(TblProductos::class, ['id_producto' => 'id_producto']);
    }

    /**
     * Gets query for [[UsuarioIng]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUsuarioIng()
    {
        return $this->hasOne(TblUsuarios::class, ['id_usuario' => 'id_usuario_ing']);
    }

    /**
     * Gets query for [[UsuarioMod]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUsuarioMod()
    {
        return $this->hasOne(TblUsuarios::class, ['id_usuario' => 'id_usuario_mod']);
    }
}
