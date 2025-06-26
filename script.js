document.addEventListener("DOMContentLoaded", function() {
    const openButton = document.getElementById('openBTN');
    const closeButton = document.getElementById('closeButton');
    const offcanvas = document.getElementById('offcanvasExample');
    const separator = document.querySelector('.separator');
    const separator2 = document.querySelector('.separator2');

    function openSidebar() {
        offcanvas.classList.add('show');
        document.body.classList.add('offcanvas-open');
        separator?.style.setProperty('display', 'block');
        separator2?.style.setProperty('display', 'block');
    }

    function closeSidebar() {
        offcanvas.classList.add('hiding');
        setTimeout(() => {
            offcanvas.classList.remove('show', 'hiding');
            document.body.classList.remove('offcanvas-open');
            separator?.style.setProperty('display', 'none');
            separator2?.style.setProperty('display', 'none');
        }, 350);
    }

    openButton?.addEventListener("click", function(e) {
        e.preventDefault();
        openSidebar();
    });

    closeButton?.addEventListener("click", function() {
        closeSidebar();
    });

    window.addEventListener("resize", function() {
        if (window.innerWidth >= 992) {
            closeSidebar();
        }
    });

    document.addEventListener("click", function(e) {
        if (
            offcanvas.classList.contains("show") &&
            !offcanvas.contains(e.target) &&
            e.target !== openButton &&
            !openButton.contains(e.target)
        ) {
            closeSidebar();
        }
    });

    const resetButtons = ["need_explanation", "central_theme", "verbum"];
    const allTypes = ["place", "date", "num", "persName_fictional", "need_explanation", "central_theme", "verbum", "orig", "sic",
        "foreign", "country", "metaphorical", "satirical", "org", "term_politici", "occupation", "term_juridical", "persName_real", "term_literature",
        "quote", "speech", "literature_work", "law"
    ];

    const toggleHighlight = (type) => {
        const isResetButton = resetButtons.includes(type);
        const button = document.getElementById(type);
        const isActive = button.classList.contains("active-btn");

        if (isResetButton && !isActive) {
            allTypes.forEach(t => {
                if (t !== type) {
                    const btn = document.getElementById(t);
                    btn?.classList.remove("active-btn");
                    btn?.style.removeProperty("background-color");
                    document.querySelectorAll(`.${t}, .zone-${t}`).forEach(el =>
                        el.classList.remove(`highlight-${t}`)
                    );
                }
            });
        }

        if (!isResetButton) {
            resetButtons.forEach(resetType => {
                const resetBtn = document.getElementById(resetType);
                if (resetBtn?.classList.contains("active-btn")) {
                    resetBtn.classList.remove("active-btn");
                    resetBtn.style.removeProperty("background-color");
                    document.querySelectorAll(`.${resetType}, .zone-${resetType}`).forEach(el =>
                        el.classList.remove(`highlight-${resetType}`)
                    );
                }
            });
        }

        button.classList.toggle("active-btn");

        const elements = document.querySelectorAll(`.${type}, .zone-${type}`);
        if (elements.length > 0) {
            elements.forEach(el => el.classList.toggle(`highlight-${type}`));
        } else if (type === "orig") {
            document.querySelectorAll(".orig").forEach(el => el.classList.toggle("highlight-orig"));
        } else if (type === "sic") {
            document.querySelectorAll(".sic").forEach(el => el.classList.toggle("highlight-sic"));
        }

        if (button.classList.contains("active-btn")) {
            const highlightClass = `highlight-${type}`;
            const sampleElement = document.querySelector(`.${highlightClass}`);
            if (sampleElement) {
                const bgColor = window.getComputedStyle(sampleElement).backgroundColor;
                const match = bgColor.match(/rgba?\((\d+),\s*(\d+),\s*(\d+)/);
                if (match) {
                    const [_, r, g, b] = match;
                    const rgbaColor = `rgba(${r}, ${g}, ${b}, 0.6)`;
                    button.style.backgroundColor = rgbaColor;
                }
            }
        } else {
            button.style.removeProperty("background-color");
        }
    };


    allTypes.forEach(type => {
        const btn = document.getElementById(type);
        if (btn) {
            btn.addEventListener("click", () => toggleHighlight(type));
        }
    });


    ["need_explanation", "orig", "sic", "law", "place", "persName_real"].forEach(type => {
        document.querySelectorAll(`.${type}`).forEach(el => {
            el.addEventListener("mouseenter", function() {
                if (this.classList.contains(`highlight-${type}`)) {
                    const tooltip =
                        document.querySelector(`.infospanSX[data-box-for="${this.id}"]`) ||
                        document.querySelector(`.infospanDX[data-box-for="${this.id}"]`);

                    console.log(`Tooltip for ${this.id}:`, tooltip);

                    if (tooltip) tooltip.style.display = "block";
                }
            });

            el.addEventListener("mouseleave", function() {
                if (this.classList.contains(`highlight-${type}`)) {
                    const tooltip =
                        document.querySelector(`.infospanSX[data-box-for="${this.id}"]`) ||
                        document.querySelector(`.infospanDX[data-box-for="${this.id}"]`);

                    if (tooltip) tooltip.style.display = "none";
                }
            });
        });
    });

    const tabButtons = [{
            buttonId: 'btn-info-rassegna',
            sectionId: 'info-rassegna'
        },
        {
            buttonId: 'btn-tag-usati',
            sectionId: 'tag-usati'
        },
        {
            buttonId: 'btn-progetto',
            sectionId: 'progetto'
        }
    ];

    tabButtons.forEach(({
        buttonId,
        sectionId
    }) => {
        const button = document.getElementById(buttonId);
        const section = document.getElementById(sectionId);

        if (button && section) {
            button.addEventListener("click", function() {
                document.querySelectorAll('.tab-button').forEach(btn => btn.classList.remove('active'));
                document.querySelectorAll('.tab-content').forEach(tab => tab.classList.remove('active'));

                button.classList.add('active');
                section.classList.add('active');
            });
        }
    });

    document.getElementById("btn-info-rassegna")?.classList.add("active");
    document.getElementById("info-rassegna")?.classList.add("active");

    const button = document.querySelector('.scopricodifica');
    let showingImages = false;

    if (button) {
        button.addEventListener('click', function() {
            const articoli = document.querySelectorAll('.box-container-articoli');
            const immagini = document.querySelectorAll('.box-container-immagini');

            if (!showingImages) {
                articoli.forEach(el => el.style.display = 'none');
                immagini.forEach(el => el.style.display = 'block');
                button.textContent = 'Mostra Testi';
                showingImages = true;
            } else {
                articoli.forEach(el => el.style.display = 'block');
                immagini.forEach(el => el.style.display = 'none');
                button.textContent = 'Mostra Immagini';
                showingImages = false;
            }
        });
    }
});