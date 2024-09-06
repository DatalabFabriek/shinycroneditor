Shiny.addCustomMessageHandler("update-cron-editor", function(message) {
    var el = document.getElementById(message.id);
    if (el) {
        el.querySelector('cron-expression-input').setAttribute('schedule', message.schedule);
    }
});

