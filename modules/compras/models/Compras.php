<?php

namespace app\modules\compras\models;

use app\models\Usuarios;
use Yii;
use yii\behaviors\BlameableBehavior;
use yii\behaviors\TimestampBehavior;

/**
 * This is the model class for table "tbl_compras".
 *
 * @property int $id_compras
 * @property string $codigo
 * @property string $num_factura
 * @property int $id_proveedor
 * @property int $tipo_compra
 * @property string $fecha
 * @property int $anulado
 * @property string|null $comentario
 * @property string|null $fecha_ing
 * @property int|null $id_usuario_ing
 * @property string|null $fecha_mod
 * @property int|null $id_usuario_mod
 * @property int $estado
 *
 * @property Proveedores $proveedor
 * @property DetCompra[] $tblDetCompras
 * @property Usuarios $usuarioIng
 * @property Usuarios $usuarioMod
 */
class Compras extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tbl_compras';
    }
    public function behaviors() {
        return [
            [
                'class' => TimestampBehavior::class,
                'createdAtAttribute'=>'fecha_ing',
                'updatedAtAttribute'=>'fecha_mod',
                'value'=> date('Y-m-d H:i:s')
            ],
            [
                'class' =>BlameableBehavior::class,
                'createdByAttribute'=>'id_usuario_ing',
                'updatedByAttribute'=>'id_usuario_mod'
            ]
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['codigo', 'num_factura', 'id_proveedor', 'tipo_compra', 'fecha', 'estado'], 'required'],
            [['id_proveedor', 'tipo_compra', 'anulado', 'id_usuario_ing', 'id_usuario_mod', 'estado'], 'integer'],
            [['fecha', 'fecha_ing', 'fecha_mod'], 'safe'],
            [['comentario'], 'string'],
            [['codigo'], 'string', 'max' => 10],
            [['num_factura'], 'string', 'max' => 8],
            [['id_proveedor'], 'exist', 'skipOnError' => true, 'targetClass' => 
            Proveedores::class, 'targetAttribute' => ['id_proveedor' => 'id_proveedor']],
            [['id_usuario_ing'], 'exist', 'skipOnError' => true, 'targetClass' => 
            Usuarios::class, 'targetAttribute' => ['id_usuario_ing' => 'id_usuario']],
            [['id_usuario_mod'], 'exist', 'skipOnError' => true, 'targetClass' => 
            Usuarios::class, 'targetAttribute' => ['id_usuario_mod' => 'id_usuario']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_compras' => 'Id',
            'codigo' => 'Codigo',
            'num_factura' => 'Numero Factura',
            'id_proveedor' => ' Proveedor',
            'tipo_compra' => 'Tipo Compra',
            'fecha' => 'Fecha',
            'anulado' => 'Anulado',
            'comentario' => 'Comentario',
            'fecha_ing' => 'Fecha Ing',
            'id_usuario_ing' => 'Id Usuario Ing',
            'fecha_mod' => 'Fecha Mod',
            'id_usuario_mod' => 'Id Usuario Mod',
            'estado' => 'Estado',
        ];
    }

    /**
     * Gets query for [[Proveedor]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getProveedor()
    {
        return $this->hasOne(Proveedores::class, ['id_proveedor' => 'id_proveedor']);
    }

    /**
     * Gets query for [[TblDetCompras]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTblDetCompras()
    {
        return $this->hasMany(DetCompras::class, ['id_compras' => 'id_compras']);
    }

    /**
     * Gets query for [[UsuarioIng]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUsuarioIng()
    {
        return $this->hasOne(Usuarios::class, ['id_usuario' => 'id_usuario_ing']);
    }

    /**
     * Gets query for [[UsuarioMod]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUsuarioMod()
    {
        return $this->hasOne(Usuarios::class, ['id_usuario' => 'id_usuario_mod']);
    }
}
