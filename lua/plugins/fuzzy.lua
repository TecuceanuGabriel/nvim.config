return {
    "camspiers/snap",
    config = function ()
        local snap = require("snap")
        snap.maps({
            { "<Leader><Leader>", snap.config.file { producer = "ripgrep.file" }},
            { "<C-p>", snap.config.file { try = {"git.file", "ripgrep.file"}}},
            { "<Leader>f", snap.config.vimgrep {}},
        })
    end
}
