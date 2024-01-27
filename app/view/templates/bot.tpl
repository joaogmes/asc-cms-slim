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
        </ul>

        <div id="chat-footer">
            <input type="text" id="message-input" placeholder="Mensagem">
            <button id="send-button">
                <i class="fas fa-paper-plane"></i> {* Send *}
            </button>
        </div>
    </div>

    <div id="template">
        <li class="message sent">
            <div class="baloon "></div>
        </li>
        <li class="message received">
            <div class="baloon "></div>
        </li>
    </div>

    <!-- Optional: jQuery via CDN -->

    <!-- Optional: Bootstrap JS via CDN -->
    <!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->

    <!-- Optional: Tailwind CSS JS via CDN -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.js"></script> -->

</body>

</html>