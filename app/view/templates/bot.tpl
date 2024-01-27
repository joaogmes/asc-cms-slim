<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        var sequence = false;
        {if $sequence}
            sequence = {$sequence};
        {/if}

        var chatSequence = false;
        {if $chatSequence}
            var chatSequence = JSON.parse({$chatSequence|json_encode});
        {/if}
    </script>
    <script src="/{$includePath}scripts/bot.js"></script>
    <link rel="stylesheet" href="/{$includePath}styles/bot.css">
</head>

<body>

    <div id="chat-container">
        <div id="chat-header">
            <img src="https://via.placeholder.com/50" alt="User Photo" style="border-radius: 50%; margin-right: 10px;">
            <span>User Name</span>
        </div>

        <ul id="chat-body">
            {$items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}
            {foreach from=$items item=item}
                {assign var="randomClass" value="sent"}
                {if rand(0, 1)}
                    {assign var="randomClass" value="received"}
                {/if}
                <li class="message {$randomClass}">
                    <div class="baloon ">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac velit sed urna
                        aliquam accumsan. Duis efficitur quam vel ante laoreet, id commodo elit pharetra. Quisque a
                        bibendum elit. Nullam ac fermentum odio. Fusce nec dictum nisl. Maecenas id massa sit amet metus
                        gravida feugiat. Curabitur fermentum justo. {$item}</div>
                </li>
            {/foreach}
        </ul>

        <div id="chat-footer">
            <input type="text" id="message-input" placeholder="Mensagem">
            <button id="send-button">
                <i class="fas fa-paper-plane"></i> {* Send *}
            </button>
        </div>
    </div>

    <!-- Optional: jQuery via CDN -->

    <!-- Optional: Bootstrap JS via CDN -->
    <!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->

    <!-- Optional: Tailwind CSS JS via CDN -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.js"></script> -->

</body>

</html>