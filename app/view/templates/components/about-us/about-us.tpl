<section class="about-us">
    <div class="container my-5 py-5">
        <div class="row">
            <div class="col-lg-10">
                <h2 class="">{$data->title}</h2>
                <h3 class="my-4">{$data->subtitle}</h3>
                <p>{$data->text}</p>
            </div>
            <div class="col-lg-2 d-flex align-items-center">
                <img class="img-fluid" src="{$data->image}">
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="container">
            <div class="row">
                {foreach from=$data->badges item=item}
                    <div class="col-lg-3 my-3 p-4 text-center badge">
                        <i class="{$item->icon} fa-4x my-4"></i>
                        <p class="text-wrap">{$item->title}</p>
                    </div>
                {/foreach}
            </div>
        </div>
    </div>
</section>