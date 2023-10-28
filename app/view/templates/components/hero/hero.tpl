<section class="hero">
    <div class="container my-5 py-5">
        <div class="row">
            <div class="col-lg-8">
                <h1 class="text-white cta-title my-4">{$data->ctaTitle}</h1>
                <div class="row">
                    {foreach from=$data->cards item=item}
                        <div class="col-lg-6 my-3">
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
            <div class="col-lg-4 d-flex align-items-center">
                <img class="img-fluid" src="{$data->ctaImage}">
            </div>
        </div>
    </div>
</section>