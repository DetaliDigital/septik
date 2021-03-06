{extends 'template:Базовый шаблон'}
{block 'content'}


<div class="container" itemscope itemtype="http://schema.org/WebPage">
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">

            {if $_modx->resource.pagetitle_full != ''}
                <h1>{$_modx->resource.pagetitle_full}</h1>
            {else}
                <h1>{$_modx->resource.pagetitle}</h1>
            {/if}
            <div class="real_content" itemprop="mainContentOfPage">
                {$_modx->resource.content}
                <div class="row">
                    {'!ms2GalleryResources' | snippet : [
                    'includeOriginal' => 1,
                    'tpl' => 'dsmc.card.portfolio',
                    'limit' => 0
                    ]}
                </div>
            </div>
        </div>
    </div>
</div>

{/block}