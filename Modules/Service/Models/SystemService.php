<?php

namespace Modules\Service\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\BaseModel;
use App\Models\Traits\HasSlug;
use App\Trait\CustomFieldsTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Modules\Category\Models\Category;

class SystemService extends BaseModel
{
    use HasFactory;
    use SoftDeletes;
    use HasSlug;
    use CustomFieldsTrait;


    protected $table = 'system_services';

    protected $fillable = ['slug', 'name', 'description', 'status'];

    const CUSTOM_FIELD_MODEL = 'Modules\Service\Models\SystemService';
    
    protected static function newFactory()
    {
        return \Modules\Service\Database\factories\SystemServiceFactory::new();
    }


    protected static function boot()
    {
        parent::boot();

        // create a event to happen on creating
        static::creating(function ($table) {
            //
        });

        static::saving(function ($table) {
            //
        });

        static::updating(function ($table) {
            //
        });
    }

    protected function getFeatureImageAttribute()
    {
        $media = $this->getFirstMediaUrl('feature_image');

        return isset($media) && ! empty($media) ? $media : default_feature_image();
    }

    public function scopeActive($query)
    {
        return $query->where('status', 1);
    }

    public function categories()
    {
        return $this->hasMany(Category::class, 'type', 'type');
    }

}
