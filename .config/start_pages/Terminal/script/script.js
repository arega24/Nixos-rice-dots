const Config = {
    name: "arega",
    scale: 1,
    Links: [
        [
            "resources",
            [
                ["github", "https://github.com/arega24/"],
                ["gmail", "https://mail.google.com/mail/u/0/#inbox"],
                ["protonmail", "https://account.proton.me/login?language=en"]
            ]
        ],
        [
            "ipl",
            [
                ["moodle", "https://ead.ipleiria.pt/2022-23/login/index.php"],
                ["horarios", "https://publico.agcp.ipleiria.pt/Paginas/ScheduleRptCursosSemanalPublico.aspx"],
                ["email", "http://webmail.my.ipleiria.pt/"]
            ]
        ],
        [
            "web-resources",
            [
                ["sympy", "https://gamma.sympy.org/"],
                ["stackexchange", "https://stackexchange.com/"],
                ["sciencedirect", "https://www.sciencedirect.com/"],
            ]
        ],
        [
            "news",
            [
                ["weforum", "https://www.weforum.org/"],
                ["apnews", "https://apnews.com/"],
                ["reuters", "https://www.reuters.com/"],
                ["dailystormer", "https://dailystormer.in/"],
                ["opensource", "https://blog.opensource.org/"],
                ["hackerone", "https://www.hackerone.com/vulnerability-and-security-testing-blog"],
                ["b1m", "https://www.theb1m.com/"]
            ]
        ],
        [
            "entertainement",
            [
                ["invidious", "https://invidious.tiekoetter.com/feed/popular"],
                ["libreddit", "https://libreddit.tiekoetter.com/"],
                ["nitter", "https://nitter.tiekoetter.com/"],
                ["lichess", "https://lichess.org/"]
            ]
        ],
        [
            "utensils",
            [
                ["snapdrop", "https://snapdrop.net/"],
                ["tradingview", "https://www.tradingview.com/"],
                ["openstreetmap", "https://www.openstreetmap.org/"],
                ["tiekoetter", "https://www.tiekoetter.com/en/services/"],
                ["simplytranslate", "https://translate.tiekoetter.com/"]
            ]
        ]
    ]
}

const Main = (() => {
    const list = document.getElementById("list");
    const names = document.querySelectorAll("[data-Name]");
    const search = document.getElementById("search");
    const form = document.forms[0];

    const init = () => {
        list.innerHTML = Config.Links.map(([gName, Links]) => `
            <li>
                <h1 onclick="this.parentNode.classList.toggle('hideChildren')">${gName}</h1>
                <ul>
                    ${Links.map(([lName, url]) => `
                        <li>
                            <a href="${url}">${lName}</a>
                        </li>`
                    ).join("")}
                </ul>
            </li>` 
        ).join("")
        
        names.forEach(el => {
            el.innerText = Config.name;
        });

        document.addEventListener("keydown", e => e.key.length === 1 && search.focus());
        search.addEventListener("keydown", () => (window.event ? event.keyCode : e.which) == 13 && form.submit());
    };

    return {
        init,
    };
})();

Main.init()
