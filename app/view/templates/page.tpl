{include file="bs-header.tpl" page=$page components=$components}
{if !empty($components)}
    {foreach from=$components item=component}
        {include file=$component.template content=$components.content}
    {/foreach}
{/if}
{include file="bs-footer.tpl" components=$components}