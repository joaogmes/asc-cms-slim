<section class="services">
    <div class="container py-5">
        <div class="row">
            <h2 class="section-title text-white">{$data->sectionTitle}</h2>
        </div>
        <div class="row">
            {foreach from=$data->cards item=item}
                <div class="col-lg-3 my-3 text-center">
                    <div class="card bg-light p-4">
                        <i class="{$item->cardIcon} fa-3x"></i>
                        <h2 class="card-title">{$item->cardTitle}</h2>
                        <p>{$item->cardText}</p>
                        <a href="{$item->cardButtonLink}" class="btn btn-primary">{$item->cardButtonText}</a>
                    </div>
                </div>
            {/foreach}
        </div>
    </div>
</section>