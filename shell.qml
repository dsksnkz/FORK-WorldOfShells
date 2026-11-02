import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

ShellRoot {
    Component.onCompleted: Quickshell.watchFiles = false

    QtObject {
        id: tok
        property color bg: "#0f1417"
        property color surface: "#171c1f"
        property color surfaceHigh: "#262b2e"
        property color fg: "#dfe3e7"
        property color fgVariant: "#c0c7cd"
        property color fgMuted: "#8a9297"
        property color fgOnPrimary: "#003549"
        property color primary: "#8ecff2"
        property color tertiary: "#c9c1ea"
        property color outline: "#8a9297"
        property color outlineVariant: "#40484d"
        property int sp1: 4
        property int sp2: 8
        property int sp3: 12
        property int sp4: 16
        property int sp5: 24
        property int sp6: 32
        property int r2: 8
        property int r3: 12
        property int r4: 16

        property int animFast: 130
        property int animMed: 200
        property int animSlow: 280

        property string colorsPath: (Quickshell.env("XDG_CACHE_HOME") || (Quickshell.env("HOME") + "/.cache")) + "/ryoku/colors.json"

        function applyColors(c) {
            if (!c || typeof c !== "object") return
            function usable(v) { return typeof v === "string" && v.length > 0 }
            if (usable(c.background)) bg = c.background
            if (usable(c.surface)) surface = c.surface
            if (usable(c.surfaceContainerHigh)) surfaceHigh = c.surfaceContainerHigh
            if (usable(c.onSurface)) fg = c.onSurface
            if (usable(c.onSurfaceVariant)) fgVariant = c.onSurfaceVariant
            if (usable(c.outline)) fgMuted = c.outline
            if (usable(c.onPrimary)) fgOnPrimary = c.onPrimary
            if (usable(c.primary)) primary = c.primary
            if (usable(c.tertiary)) tertiary = c.tertiary
            if (usable(c.outline)) outline = c.outline
            if (usable(c.outlineVariant)) outlineVariant = c.outlineVariant
        }
    }

    FileView {
        id: colorsFile
        path: tok.colorsPath
        blockLoading: true
        watchChanges: true
        printErrors: false
        onFileChanged: reload()
        onLoaded: {
            try {
                const t = colorsFile.text()
                const c = t && t.length ? JSON.parse(t) : null
                if (c) tok.applyColors(c)
            } catch (e) {}
        }
        Component.onCompleted: {
            try { reload() } catch (e) {}
        }
    }

    property var shells: [
        {
            name: "MacShell",
            author: "0-ss (Rickky) & vSuol",
            license: "MIT",
            stars: "328",
            forks: "27",
            github: "https://github.com/0-ss/MacShell",
            video: "",
            tagline: "Barre de menus + Dock façon macOS Tahoe pour Hyprland.",
            bio: "Barre de menus + Dock façon macOS Tahoe. Liquid Glass, Spotlight, widgets, MacLock.",
            features: ["Liquid Glass", "Spotlight", "Widgets", "Captures d'écran", "MacLock", "Alt+Tab"],
            prereqs: "Hyprland 0.55+ (config Lua), Quickshell 0.3.0+, Qt 6.5+, qsb.",
            logo: "https://github.com/user-attachments/assets/bc67b3fa-33a6-4326-9752-f0d271d0ed22",
            featured: "https://github.com/user-attachments/assets/600f75bc-b4d1-442d-bec5-41ee7dfa5023",
            thumbs: ["https://github.com/user-attachments/assets/edf45f8f-b71a-4bc5-9880-46dafbebf47c", "https://github.com/user-attachments/assets/cb6c5708-5786-4328-89bd-24737d39e482", "https://github.com/user-attachments/assets/6ef28e50-612f-4e7b-9822-c0aa0168a6ae"],
            activateScript: "/home/warren/.config/quickshell/WorldOfShells/activate.sh",
            revertScript: "/home/warren/.config/quickshell/WorldOfShells/revert.sh",
            activatable: true
        },
        {
            name: "end-4 (illogical-impulse)",
            author: "end-4",
            license: "GPL-3.0",
            stars: "16.5k",
            forks: "1.4k",
            github: "https://github.com/end-4/dots-hyprland",
            video: "https://www.youtube.com/watch?v=RPwovTInagE",
            tagline: "Dotfiles usability-first pour Hyprland. Material Design 3, IA intégrée, widgets riches.",
            bio: "Dotfiles « usability-first » pour Hyprland. Material Design 3, IA intégrée, widgets riches, sidebar, launcher. Très populaire (16.5k étoiles).",
            features: ["Material Design 3", "IA intégrée", "Widgets riches", "Sidebar", "Lock screen", "Thèmes dynamiques"],
            prereqs: "Hyprland 0.55+, Quickshell, Qt 6, Arch Linux recommandé.",
            logo: "https://github.com/user-attachments/assets/9d7af13f-89ef-470d-ba78-d2288b79cf60",
            featured: "https://github.com/user-attachments/assets/5d4e7d07-d0b4-4406-a4c9-ed7ba90e3fe4",
            thumbs: ["https://github.com/user-attachments/assets/6a32395f-9437-4192-8faf-2951a9e84cbe", "https://github.com/user-attachments/assets/c51bed8b-3670-4d4c-9074-873be224fb8e", "https://github.com/user-attachments/assets/98703a66-0743-439f-a721-cef7afa6ab95"],
            activateScript: "/home/warren/.config/quickshell/WorldOfShells/end4-activate.sh",
            revertScript: "/home/warren/.config/quickshell/WorldOfShells/end4-revert.sh",
            activatable: true
        },
        {
            name: "DankMaterialShell (DMS)",
            author: "AvengeMedia / duxlabs-dev",
            license: "MIT",
            stars: "8.7k",
            forks: "575",
            github: "https://github.com/duxlabs-dev/dux-shell",
            video: "",
            tagline: "Shell Material Design 3 pour Hyprland, Niri, Sway et plus.",
            bio: "Shell complet pour Wayland. Material Design 3, panneaux, widgets, thèmes dynamiques, notifications, launcher, lock screen. Multi-compositor.",
            features: ["Material Design 3", "Panneaux & widgets", "Thèmes dynamiques", "Notifications", "Launcher", "Multi-compositor"],
            prereqs: "Hyprland/Niri/Sway, Quickshell, Go.",
            logo: "https://github.com/user-attachments/assets/203a9678-c3b7-4720-bb97-853a511ac5c8",
            featured: "https://github.com/user-attachments/assets/732c30de-5f4a-4a2b-a995-c8ab656cecd5",
            thumbs: ["https://github.com/user-attachments/assets/a937cf35-a43b-4558-8c39-5694ff5fcac4", "https://github.com/user-attachments/assets/2da00ea1-8921-4473-a2a9-44a44535a822", "https://github.com/user-attachments/assets/732c30de-5f4a-4a2b-a995-c8ab656cecd5"],
            activateScript: "/home/warren/.config/quickshell/WorldOfShells/dms-activate.sh",
            revertScript: "/home/warren/.config/quickshell/WorldOfShells/dms-revert.sh",
            activatable: true
        },
        {
            name: "Nucleus Shell",
            author: "nucleus-hq",
            license: "GPL-3.0",
            stars: "721",
            forks: "0",
            github: "https://github.com/nucleus-hq/nucleus-shell",
            video: "",
            tagline: "Shell flexible et extensible, QML/C++/JS.",
            bio: "Shell de bureau flexible et extensible, construit avec QML, C++ et JavaScript. Quickshell-based. Modulaire et personnalisable.",
            features: ["Extensible", "Modulaire", "Multi-compositor", "Personnalisable"],
            prereqs: "Hyprland/Niri, Quickshell, Qt 6.",
            logo: "https://raw.githubusercontent.com/nucleus-hq/nucleus-shell/main/previews/Forests.png",
            featured: "https://raw.githubusercontent.com/nucleus-hq/nucleus-shell/main/previews/Passion.png",
            thumbs: ["https://raw.githubusercontent.com/nucleus-hq/nucleus-shell/main/previews/Forests.png", "https://raw.githubusercontent.com/nucleus-hq/nucleus-shell/main/previews/Love.png", "https://raw.githubusercontent.com/nucleus-hq/nucleus-shell/main/previews/Metallic.png"],
            activateScript: "/home/warren/.config/quickshell/WorldOfShells/nucleus-activate.sh",
            revertScript: "/home/warren/.config/quickshell/WorldOfShells/nucleus-revert.sh",
            activatable: true
        },
        {
            name: "Nandoroid",
            author: "na-ive",
            license: "AGPL-3.0",
            stars: "179",
            forks: "0",
            github: "https://github.com/na-ive/nandoroid-shell",
            video: "",
            tagline: "Shell Hyprland inspiré des ROM Android custom.",
            bio: "Shell opinionné pour Hyprland, inspiré des ROM Android custom. Quickshell-based, avec dynamic island, widgets, notifications.",
            features: ["Dynamic Island", "Widgets", "Notifications", "Thèmes", "Android-inspired"],
            prereqs: "Hyprland, Quickshell, Qt 6.",
            logo: "https://raw.githubusercontent.com/na-ive/nandoroid-docs/refs/heads/main/public/showcase1.png",
            featured: "https://raw.githubusercontent.com/na-ive/nandoroid-docs/refs/heads/main/public/showcase1.png",
            thumbs: ["https://raw.githubusercontent.com/na-ive/nandoroid-docs/refs/heads/main/public/showcase2.png", "https://raw.githubusercontent.com/na-ive/nandoroid-docs/refs/heads/main/public/showcase3.png", "https://raw.githubusercontent.com/na-ive/nandoroid-docs/refs/heads/main/public/showcase4.png"],
            activateScript: "/home/warren/.config/quickshell/WorldOfShells/nandoroid-activate.sh",
            revertScript: "/home/warren/.config/quickshell/WorldOfShells/nandoroid-revert.sh",
            activatable: true
        },
        {
            name: "SekaiPop",
            author: "Blapples",
            license: "GPL-3.0",
            stars: "526",
            forks: "0",
            github: "https://github.com/Blapples/SekaiPop",
            video: "",
            tagline: "Shell inspiré de Project Sekai. Vibe-coded, passion project.",
            bio: "Shell inspiré de Project Sekai, avec control center, equalizer, edit desktop, shader transitions, deux lockscreens. Passion project vibe-coded.",
            features: ["Control center", "Equalizer", "Edit desktop", "Shader transitions", "Lock screens", "Phone integration"],
            prereqs: "Hyprland, Quickshell, Qt 6.",
            logo: "https://raw.githubusercontent.com/Blapples/SekaiPop/main/assets/shot-desktop-widgets.png",
            featured: "https://raw.githubusercontent.com/Blapples/SekaiPop/main/assets/shot-desktop-widgets.png",
            thumbs: ["https://raw.githubusercontent.com/Blapples/SekaiPop/main/assets/shot-edit-desktop.png", "https://raw.githubusercontent.com/Blapples/SekaiPop/main/assets/shot-quick-panel-phone.png", "https://raw.githubusercontent.com/Blapples/SekaiPop/main/assets/shot-sekai-pad-eq.png"],
            activateScript: "/home/warren/.config/quickshell/WorldOfShells/sekaipop-activate.sh",
            revertScript: "/home/warren/.config/quickshell/WorldOfShells/sekaipop-revert.sh",
            activatable: true
        },
        {
            name: "Twinshell",
            author: "etherealboi",
            license: "GPL-3.0",
            stars: "5",
            forks: "0",
            github: "https://github.com/etherealboi/twinshell",
            video: "",
            tagline: "Shell clavier-centrique pour Hyprland.",
            bio: "Shell clavier-centrique pour Hyprland, avec barre, screenshot tool, screen recording. Minimal et fonctionnel.",
            features: ["Barre", "Workspaces", "Screenshot", "Screen recording", "Audio", "Network"],
            prereqs: "Hyprland, Quickshell, Qt 6.",
            logo: "https://opengraph.githubassets.com/1/etherealboi/twinshell",
            featured: "https://opengraph.githubassets.com/1/etherealboi/twinshell",
            thumbs: ["https://opengraph.githubassets.com/1/etherealboi/twinshell", "https://opengraph.githubassets.com/1/etherealboi/twinshell", "https://opengraph.githubassets.com/1/etherealboi/twinshell"],
            activateScript: "/home/warren/.config/quickshell/WorldOfShells/twinshell-activate.sh",
            revertScript: "/home/warren/.config/quickshell/WorldOfShells/twinshell-revert.sh",
            activatable: true
        },
        {
            name: "QSDots",
            author: "BelimFaux",
            license: "MIT",
            stars: "5",
            forks: "0",
            github: "https://github.com/BelimFaux/qsdots",
            video: "",
            tagline: "Dotfiles quickshell pour Hyprland.",
            bio: "Dotfiles quickshell pour Hyprland. Barre, notifications, OSD, lockscreen, mediaplayer, services.",
            features: ["Barre", "Notifications", "OSD", "Lockscreen", "Mediaplayer", "Services"],
            prereqs: "Hyprland, Quickshell, Qt 6.",
            logo: "https://raw.githubusercontent.com/BelimFaux/qsdots/main/examples/desktop.png",
            featured: "https://raw.githubusercontent.com/BelimFaux/qsdots/main/examples/desktop.png",
            thumbs: ["https://raw.githubusercontent.com/BelimFaux/qsdots/main/examples/desktop.png", "https://raw.githubusercontent.com/BelimFaux/qsdots/main/examples/desktop.png", "https://raw.githubusercontent.com/BelimFaux/qsdots/main/examples/desktop.png"],
            activateScript: "/home/warren/.config/quickshell/WorldOfShells/qsdots-activate.sh",
            revertScript: "/home/warren/.config/quickshell/WorldOfShells/qsdots-revert.sh",
            activatable: true
        },
        {
            name: "Asaki Shell",
            author: "AsakiYuki",
            license: "Unknown",
            stars: "0",
            forks: "0",
            github: "https://github.com/AsakiYuki/quickshell",
            video: "",
            tagline: "Shell simple pour Hyprland.",
            bio: "Shell simple pour Hyprland, avec barre, modules, configuration. Minimal et fonctionnel.",
            features: ["Barre", "Modules", "Configuration", "Wallpaper"],
            prereqs: "Hyprland, Quickshell, Qt 6.",
            logo: "https://opengraph.githubassets.com/1/AsakiYuki/quickshell",
            featured: "https://opengraph.githubassets.com/1/AsakiYuki/quickshell",
            thumbs: ["https://opengraph.githubassets.com/1/AsakiYuki/quickshell", "https://opengraph.githubassets.com/1/AsakiYuki/quickshell", "https://opengraph.githubassets.com/1/AsakiYuki/quickshell"],
            activateScript: "/home/warren/.config/quickshell/WorldOfShells/asaki-activate.sh",
            revertScript: "/home/warren/.config/quickshell/WorldOfShells/asaki-revert.sh",
            activatable: true
        },
        {
            name: "MaterialUI",
            author: "ps2string",
            license: "MIT",
            stars: "0",
            forks: "0",
            github: "https://github.com/ps2string/quickshell-materialui",
            video: "",
            tagline: "Shell Material Design 3 pour Hyprland.",
            bio: "Shell Material Design 3 pour Hyprland, avec barre, launcher, quicksettings, dock. Android 16 M3 UI.",
            features: ["Material Design 3", "Barre", "Launcher", "Quick settings", "Dock", "Android M3"],
            prereqs: "Hyprland, Quickshell, Qt 6.",
            logo: "https://opengraph.githubassets.com/1/ps2string/quickshell-materialui",
            featured: "https://opengraph.githubassets.com/1/ps2string/quickshell-materialui",
            thumbs: ["https://opengraph.githubassets.com/1/ps2string/quickshell-materialui", "https://opengraph.githubassets.com/1/ps2string/quickshell-materialui", "https://opengraph.githubassets.com/1/ps2string/quickshell-materialui"],
            activateScript: "/home/warren/.config/quickshell/WorldOfShells/materialui-activate.sh",
            revertScript: "/home/warren/.config/quickshell/WorldOfShells/materialui-revert.sh",
            activatable: true
        },
        {
            name: "Vantage",
            author: "simeulinuxkaliaiwr",
            license: "MIT",
            stars: "24",
            forks: "0",
            github: "https://github.com/simeulinuxkaliaiwr/vantage",
            video: "",
            tagline: "Shell simple et minimal pour Hyprland.",
            bio: "Shell simple et minimal pour Hyprland, avec barre, widgets, wallpaper picker, game mode, keep-awake. Installateur inclus.",
            features: ["Barre", "Widgets", "Wallpaper picker", "Game mode", "Keep-awake", "Night light"],
            prereqs: "Hyprland, Quickshell, Qt 6.",
            logo: "https://opengraph.githubassets.com/1/simeulinuxkaliaiwr/vantage",
            featured: "https://opengraph.githubassets.com/1/simeulinuxkaliaiwr/vantage",
            thumbs: ["https://opengraph.githubassets.com/1/simeulinuxkaliaiwr/vantage", "https://opengraph.githubassets.com/1/simeulinuxkaliaiwr/vantage", "https://opengraph.githubassets.com/1/simeulinuxkaliaiwr/vantage"],
            activateScript: "/home/warren/.config/quickshell/WorldOfShells/vantage-activate.sh",
            revertScript: "/home/warren/.config/quickshell/WorldOfShells/vantage-revert.sh",
            activatable: true
        },
        {
            name: "Ukishima",
            author: "amanhex",
            license: "MIT",
            stars: "119",
            forks: "0",
            github: "https://github.com/amanhex/ukishima",
            video: "",
            tagline: "Shell pill/bar pour Hyprland. Compositor-aware.",
            bio: "Shell pill/bar pour Hyprland avec compositor-aware workspaces, window state, keyboard layout, lock backends. Extras: night light, game mode, keep-awake, in-app updater.",
            features: ["Pill bar", "Compositor-aware", "Night light", "Game mode", "Keep-awake", "In-app updater"],
            prereqs: "Hyprland, Quickshell, Qt 6.",
            logo: "https://raw.githubusercontent.com/amanhex/Ukishima/master/assets/ukishima-readme-banner.png",
            featured: "https://raw.githubusercontent.com/amanhex/Ukishima/master/assets/ukishima-readme-banner.png",
            thumbs: ["https://raw.githubusercontent.com/amanhex/Ukishima/master/assets/ukishima-readme-banner.png", "https://raw.githubusercontent.com/amanhex/Ukishima/master/assets/ukishima-readme-banner.png", "https://raw.githubusercontent.com/amanhex/Ukishima/master/assets/ukishima-readme-banner.png"],
            activateScript: "/home/warren/.config/quickshell/WorldOfShells/ukishima-activate.sh",
            revertScript: "/home/warren/.config/quickshell/WorldOfShells/ukishima-revert.sh",
            activatable: true
        },
        {
            name: "Lucid",
            author: "sn3akyy1",
            license: "MIT",
            stars: "322",
            forks: "12",
            github: "https://github.com/sn3akyy1/lucid",
            video: "",
            tagline: "Shell dynamique pour Hyprland.",
            bio: "Shell dynamique pour Hyprland avec barre, dock, widgets, lock screen, thèmes. Inspiré de Caelestia.",
            features: ["Barre", "Dock", "Widgets", "Lock screen", "Thèmes", "Dynamic colors"],
            prereqs: "Hyprland, Quickshell, Qt 6.",
            logo: "https://raw.githubusercontent.com/Sn3akyy1/lucid/main/assets/fallback.jpg",
            featured: "https://raw.githubusercontent.com/Sn3akyy1/lucid/main/assets/fallback.jpg",
            thumbs: ["https://raw.githubusercontent.com/Sn3akyy1/lucid/main/assets/fallback.jpg", "https://raw.githubusercontent.com/Sn3akyy1/lucid/main/assets/fallback.jpg", "https://raw.githubusercontent.com/Sn3akyy1/lucid/main/assets/fallback.jpg"],
            activateScript: "/home/warren/.config/quickshell/WorldOfShells/lucid-activate.sh",
            revertScript: "/home/warren/.config/quickshell/WorldOfShells/lucid-revert.sh",
            activatable: true
        },
        {
            name: "Nothingshell",
            author: "Tsunami43",
            license: "MIT",
            stars: "26",
            forks: "0",
            github: "https://github.com/Tsunami43/nothingshell",
            video: "",
            tagline: "Shell complet pour Hyprland en un processus.",
            bio: "Shell complet pour Hyprland en un seul processus Quickshell : barre, dashboard, launcher, settings, lock et login screen.",
            features: ["Barre", "Dashboard", "Launcher", "Settings", "Lock screen", "Login screen"],
            prereqs: "Hyprland, Quickshell, Qt 6.",
            logo: "https://raw.githubusercontent.com/Tsunami43/nothingshell/master/.github/assets/screenshots.jpg",
            featured: "https://raw.githubusercontent.com/Tsunami43/nothingshell/master/.github/assets/screenshots.jpg",
            thumbs: ["https://raw.githubusercontent.com/Tsunami43/nothingshell/master/.github/assets/demo.gif", "https://raw.githubusercontent.com/Tsunami43/nothingshell/master/.github/assets/screenshots.jpg", "https://raw.githubusercontent.com/Tsunami43/nothingshell/master/.github/assets/screenshots.jpg"],
            activateScript: "/home/warren/.config/quickshell/WorldOfShells/nothingshell-activate.sh",
            revertScript: "/home/warren/.config/quickshell/WorldOfShells/nothingshell-revert.sh",
            activatable: true
        },
        {
            name: "NibrasShell",
            author: "AhmedSaadi0",
            license: "MIT",
            stars: "778",
            forks: "0",
            github: "https://github.com/AhmedSaadi0/NibrasShell",
            video: "",
            tagline: "Shell AI-intégré pour Hyprland. Material Design 3.",
            bio: "Shell AI-intégré pour Hyprland. Material Design 3, Claude AI, live wallpaper theming, widgets, animations. Anglais et russe.",
            features: ["AI intégré", "Material Design 3", "Live theming", "Widgets", "Animations", "Multi-langue"],
            prereqs: "Hyprland, Quickshell, Qt 6.",
            logo: "https://raw.githubusercontent.com/AhmedSaadi0/my-hyprland-config/main/screenshots/dark_1.png",
            featured: "https://raw.githubusercontent.com/AhmedSaadi0/my-hyprland-config/main/screenshots/dark_1.png",
            thumbs: ["https://raw.githubusercontent.com/AhmedSaadi0/my-hyprland-config/main/screenshots/dark_2.png", "https://raw.githubusercontent.com/AhmedSaadi0/my-hyprland-config/main/screenshots/dark_3.png", "https://raw.githubusercontent.com/AhmedSaadi0/my-hyprland-config/main/screenshots/dark_4.png"],
            activateScript: "/home/warren/.config/quickshell/WorldOfShells/nibras-activate.sh",
            revertScript: "/home/warren/.config/quickshell/WorldOfShells/nibras-revert.sh",
            activatable: true
        },
        {
            name: "Impasto",
            author: "andreumassanet",
            license: "GPL-3.0",
            stars: "417",
            forks: "0",
            github: "https://github.com/andreumassanet/impasto",
            video: "",
            tagline: "Shell dynamique avec îlot, widgets, notes et tâches.",
            bio: "Shell dynamique pour Hyprland avec îlot dynamique, widgets desktop, notes et tâches, one-script installer. Inspiré de caelestia.",
            features: ["Dynamic island", "Widgets", "Notes", "Tasks", "Thèmes", "Installer"],
            prereqs: "Hyprland, Quickshell, Qt 6.",
            logo: "https://opengraph.githubassets.com/1/andreumassanet/impasto",
            featured: "https://opengraph.githubassets.com/1/andreumassanet/impasto",
            thumbs: ["https://opengraph.githubassets.com/1/andreumassanet/impasto", "https://opengraph.githubassets.com/1/andreumassanet/impasto", "https://opengraph.githubassets.com/1/andreumassanet/impasto"],
            activateScript: "/home/warren/.config/quickshell/WorldOfShells/impasto-activate.sh",
            revertScript: "/home/warren/.config/quickshell/WorldOfShells/impasto-revert.sh",
            activatable: true
        }
    ]

    property var tutorialSteps: [
        {
            icon: "\u2726",
            badge: "ÉTAPE 1 SUR 7  •  INTRODUCTION",
            title: "Bienvenue dans World of Shells",
            desc: "Explorez et essayez facilement 14 environnements Quickshell pour Hyprland en un clic, sans compromettre votre configuration principale Ryoku.",
            hint: "Utilisez les boutons Suivant / Précédent ou les flèches du clavier pour parcourir ce guide."
        },
        {
            icon: "\u2630",
            badge: "ÉTAPE 2 SUR 7  •  NAVIGATION",
            title: "Sélecteur de shells",
            desc: "Le panneau latéral gauche liste tous les shells disponibles. Faites défiler pour parcourir la liste. Cliquez sur une carte pour inspecter ses détails.",
            hint: "Chaque carte affiche le logo, l'auteur et le nombre d'étoiles GitHub du projet."
        },
        {
            icon: "\uD83D\uDD0D",
            badge: "ÉTAPE 3 SUR 7  •  APERÇUS VISUELS",
            title: "Galerie d'images",
            desc: "Le panneau de droite présente une grande capture principale ainsi qu'une bande de miniatures. Cliquez sur n'importe quelle image pour l'ouvrir en plein écran (lightbox).",
            hint: "Dans la lightbox : utilisez la molette pour zoomer, glissez pour vous déplacer et double-cliquez pour réinitialiser."
        },
        {
            icon: "\u25B6",
            badge: "ÉTAPE 4 SUR 7  •  TEST EN DIRECT",
            title: "Activer un shell",
            desc: "Cliquez sur le bouton « Activer » en bas à droite pour tester immédiatement le shell sélectionné. Ryoku est mis en pause proprement pendant que le nouveau shell se lance.",
            hint: "Pour end-4 (dotfiles complets), une fenêtre de confirmation s'affiche avant toute installation."
        },
        {
            icon: "\u21BA",
            badge: "ÉTAPE 5 SUR 7  •  RESTAURATION",
            title: "Revenir à Ryoku",
            desc: "À tout moment, cliquez sur le bouton « ↺ Revenir à Ryoku » situé en bas du panneau gauche pour arrêter le shell en cours d'essai et restaurer instantanément votre environnement Ryoku.",
            hint: "L'indicateur d'état juste au-dessus du bouton vous confirme chaque opération."
        },
        {
            icon: "\u2699",
            badge: "ÉTAPE 6 SUR 7  •  CONFIGURATION",
            title: "Paramètres",
            desc: "Le bouton « ⚙ Paramètres » situé dans l'en-tête du panneau gauche permet d'ouvrir le panneau des préférences de World of Shells (actuellement en aperçu).",
            hint: "Vous pourrez également y relancer ce tutoriel à tout moment."
        },
        {
            icon: "\u2713",
            badge: "ÉTAPE 7 SUR 7  •  PRÊT",
            title: "C'est parti !",
            desc: "Vous connaissez maintenant toutes les fonctionnalités de World of Shells. Cliquez sur « Terminer » pour commencer à explorer et tester vos environnements Hyprland.",
            hint: "Ce tutoriel ne s'affichera plus automatiquement lors de vos prochains lancements."
        }
    ]

    FloatingWindow {
        id: win
        title: "World of Shells"
        minimumSize: Qt.size(700, 500)
        implicitWidth: 1120
        implicitHeight: 740
        onClosed: Qt.quit()

        color: tok.bg
        Behavior on color { ColorAnimation { duration: tok.animMed } }

        property int selectedShell: 0
        property int shellPage: 0
        property bool busy: false
        property bool confirmEnd4: false
        property bool settingsOpen: false
        property bool tutorialOpen: false
        property int tutorialStep: 0
        property int tutorialDirection: 1
        property string statusText: "Prêt. Sélectionnez un shell à explorer ou activer."
        property var shell: shells[selectedShell]

        property bool lightboxOpen: false
        property string lightboxSource: ""
        property real lightboxZoom: 1.0
        property real lightboxPanX: 0
        property real lightboxPanY: 0

        Behavior on lightboxZoom {
            NumberAnimation { duration: 140; easing.type: Easing.OutCubic }
        }
        Behavior on lightboxPanX {
            enabled: !lbMouse.pressed
            NumberAnimation { duration: 160; easing.type: Easing.OutCubic }
        }
        Behavior on lightboxPanY {
            enabled: !lbMouse.pressed
            NumberAnimation { duration: 160; easing.type: Easing.OutCubic }
        }

        property string tutorialFlagPath: (Quickshell.env("HOME") || "/home/warren") + "/.config/WorldOfShells/tutorial_done"

        onSelectedShellChanged: {
            shellSwitchAnim.restart()
        }

        function goToTutorialStep(newStep) {
            if (newStep < 0 || newStep >= tutorialSteps.length || newStep === win.tutorialStep) return
            win.tutorialDirection = newStep > win.tutorialStep ? 1 : -1
            win.tutorialStep = newStep
            tutStepAnim.restart()
        }

        Process {
            id: checkTutorialProc
            command: ["bash", "-c", "test -f \"" + win.tutorialFlagPath + "\""]
            onExited: (code) => {
                if (code !== 0) {
                    win.tutorialStep = 0
                    win.tutorialOpen = true
                }
            }
            Component.onCompleted: running = true
        }

        function completeTutorial() {
            win.tutorialOpen = false
            Quickshell.execDetached([
                "bash", "-c",
                "mkdir -p \"$(dirname \"" + win.tutorialFlagPath + "\")\" && touch \"" + win.tutorialFlagPath + "\""
            ])
        }

        function openLightbox(src) {
            lightboxSource = src
            lightboxZoom = 1.0
            lightboxPanX = 0
            lightboxPanY = 0
            lightboxOpen = true
        }
        function closeLightbox() { lightboxOpen = false }

        Timer {
            id: actTimer
            interval: 800
            onTriggered: {
                win.busy = false
                if (win.selectedShell === 0) {
                    win.statusText = "MacShell actif."
                } else if (win.selectedShell === 2) {
                    win.statusText = "DMS actif."
                } else if (win.selectedShell === 3) {
                    win.statusText = "Nucleus actif."
                } else {
                    win.statusText = win.shell.name + " actif."
                }
            }
        }

        Timer {
            id: revTimer
            interval: 800
            onTriggered: {
                win.busy = false
                win.statusText = "Retour à Ryoku effectué."
            }
        }

        function activate() {
            if (win.busy) return
            if (win.selectedShell === 1) { win.confirmEnd4 = true; return }
            win.busy = true
            win.statusText = "Activation de " + win.shell.name + "..."
            Quickshell.execDetached(["bash", win.shell.activateScript])
            actTimer.restart()
        }
        function confirmEnd4Activate() {
            win.confirmEnd4 = false
            win.busy = true
            win.statusText = "Sauvegarde de Ryoku + lancement de l'installateur end-4..."
            Quickshell.execDetached(["bash", win.shell.activateScript])
            actTimer.restart()
        }
        function cancelEnd4Activate() {
            win.confirmEnd4 = false
            win.statusText = "Annulé."
        }
        function revert() {
            if (win.busy || !win.shell.revertScript) return
            win.busy = true
            win.statusText = "Restauration de Ryoku..."
            Quickshell.execDetached(["bash", win.shell.revertScript])
            revTimer.restart()
        }

        // Transition animation when switching selectedShell
        ParallelAnimation {
            id: shellSwitchAnim
            NumberAnimation {
                target: rightPanelContainer
                property: "opacity"
                from: 0.45
                to: 1.0
                duration: 180
                easing.type: Easing.OutCubic
            }
            NumberAnimation {
                target: rightPanelTrans
                property: "y"
                from: 8
                to: 0
                duration: 200
                easing.type: Easing.OutCubic
            }
            NumberAnimation {
                target: leftMetaCol
                property: "opacity"
                from: 0.45
                to: 1.0
                duration: 180
                easing.type: Easing.OutCubic
            }
        }

        // Main two-pane layout
        RowLayout {
            anchors.fill: parent
            anchors.margins: tok.sp5
            spacing: tok.sp5

            // ================= LEFT PANEL (300px) =================
            ColumnLayout {
                Layout.preferredWidth: 300
                Layout.maximumWidth: 300
                Layout.fillHeight: true
                spacing: tok.sp4

                // App Header + Settings Button
                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 2
                    RowLayout {
                        Layout.fillWidth: true
                        spacing: tok.sp2
                        Rectangle {
                            width: 8
                            height: 20
                            radius: 4
                            color: tok.primary
                            Behavior on color { ColorAnimation { duration: tok.animMed } }
                        }
                        Text {
                            text: "World of Shells"
                            font.pixelSize: 20
                            font.weight: Font.Bold
                            color: tok.fg
                            elide: Text.ElideRight
                            Layout.fillWidth: true
                        }
                        Rectangle {
                            Layout.preferredWidth: settingsBtnRow.implicitWidth + tok.sp2 * 2
                            Layout.preferredHeight: 26
                            radius: tok.r2
                            color: settingsBtnMouse.containsMouse ? tok.surfaceHigh : tok.surface
                            border.width: 1
                            border.color: settingsBtnMouse.containsMouse ? tok.primary : tok.outlineVariant
                            scale: settingsBtnMouse.pressed ? 0.95 : (settingsBtnMouse.containsMouse ? 1.03 : 1.0)
                            Behavior on color { ColorAnimation { duration: tok.animFast } }
                            Behavior on border.color { ColorAnimation { duration: tok.animFast } }
                            Behavior on scale { NumberAnimation { duration: tok.animFast; easing.type: Easing.OutQuad } }

                            RowLayout {
                                id: settingsBtnRow
                                anchors.centerIn: parent
                                spacing: 4
                                Text {
                                    text: "\u2699"
                                    font.pixelSize: 12
                                    color: tok.primary
                                    rotation: settingsBtnMouse.containsMouse ? 45 : 0
                                    Behavior on rotation { NumberAnimation { duration: tok.animMed; easing.type: Easing.OutBack } }
                                }
                                Text {
                                    text: "Paramètres"
                                    font.pixelSize: 10
                                    font.weight: Font.Medium
                                    color: tok.fgVariant
                                }
                            }
                            MouseArea {
                                id: settingsBtnMouse
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                onClicked: win.settingsOpen = true
                            }
                        }
                    }
                    Text {
                        text: "Sélecteur d'environnements Quickshell"
                        font.pixelSize: 11
                        color: tok.fgMuted
                        elide: Text.ElideRight
                        Layout.fillWidth: true
                    }
                }

                // Shell Selector Cards
                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: tok.sp2
                    Repeater {
                        model: Math.min(4, shells.length - win.shellPage * 4)
                        Rectangle {
                            id: cardRect
                            property int shellIndex: win.shellPage * 4 + index
                            property bool isSelected: win.selectedShell === shellIndex
                            property bool hovered: cardMouse.containsMouse
                            Layout.fillWidth: true
                            height: 68
                            radius: tok.r3
                            color: isSelected ? tok.surfaceHigh : (hovered ? "#1e2428" : tok.bg)
                            border.width: isSelected ? 2 : 1
                            border.color: isSelected ? tok.primary : (hovered ? tok.outline : tok.outlineVariant)

                            RowLayout {
                                anchors.fill: parent
                                anchors.margins: tok.sp3
                                spacing: tok.sp3

                                Rectangle {
                                    Layout.preferredWidth: 44
                                    Layout.preferredHeight: 44
                                    radius: tok.r2
                                    color: cardRect.isSelected ? tok.bg : tok.surface
                                    border.width: 1
                                    border.color: tok.outlineVariant
                                    Image {
                                        anchors.fill: parent
                                        anchors.margins: 6
                                        source: shells[cardRect.shellIndex].logo
                                        fillMode: Image.PreserveAspectFit
                                        sourceSize: Qt.size(44, 44)
                                        asynchronous: true
                                        cache: false
                                        opacity: status === Image.Ready ? 1.0 : 0.3
                                    }
                                }

                                ColumnLayout {
                                    Layout.fillWidth: true
                                    spacing: 2
                                    Text {
                                        text: shells[cardRect.shellIndex].name
                                        font.pixelSize: 14
                                        font.weight: cardRect.isSelected ? Font.Bold : Font.Medium
                                        color: cardRect.isSelected ? tok.primary : tok.fg
                                        elide: Text.ElideRight
                                        Layout.fillWidth: true
                                    }
                                    Text {
                                        text: "par " + shells[cardRect.shellIndex].author
                                        font.pixelSize: 11
                                        color: tok.fgVariant
                                        elide: Text.ElideRight
                                        Layout.fillWidth: true
                                    }
                                }

                                Rectangle {
                                    Layout.preferredWidth: starBadgeText.implicitWidth + tok.sp2 * 2
                                    Layout.preferredHeight: 22
                                    radius: 11
                                    color: cardRect.isSelected ? tok.primary : tok.surfaceHigh
                                    Text {
                                        id: starBadgeText
                                        anchors.centerIn: parent
                                        text: "\u2605 " + shells[cardRect.shellIndex].stars
                                        font.pixelSize: 10
                                        font.weight: Font.Bold
                                        color: cardRect.isSelected ? tok.fgOnPrimary : tok.fgVariant
                                    }
                                }
                            }

                            MouseArea {
                                id: cardMouse
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                onClicked: win.selectedShell = cardRect.shellIndex
                            }
                        }
                    }

                    // Navigation buttons
                    RowLayout {
                        Layout.fillWidth: true
                        spacing: tok.sp2
                        Rectangle {
                            property bool canPrev: win.shellPage > 0
                            Layout.fillWidth: true
                            height: 28
                            radius: tok.r2
                            color: canPrev ? (prevPageMouse.containsMouse ? tok.primary : tok.surfaceHigh) : tok.surface
                            opacity: canPrev ? 1.0 : 0.4
                            Text {
                                anchors.centerIn: parent
                                text: "\u25B2  Prec"
                                font.pixelSize: 10
                                font.weight: Font.Medium
                                color: prevPageMouse.containsMouse && parent.canPrev ? tok.fgOnPrimary : tok.fgVariant
                            }
                            MouseArea {
                                id: prevPageMouse
                                anchors.fill: parent
                                enabled: win.shellPage > 0
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                onClicked: if (win.shellPage > 0) win.shellPage--
                            }
                        }
                        Rectangle {
                            property bool canNext: (win.shellPage + 1) * 4 < shells.length
                            Layout.fillWidth: true
                            height: 28
                            radius: tok.r2
                            color: canNext ? (nextPageMouse.containsMouse ? tok.primary : tok.surfaceHigh) : tok.surface
                            opacity: canNext ? 1.0 : 0.4
                            Text {
                                anchors.centerIn: parent
                                text: "Suiv  \u25BC"
                                font.pixelSize: 10
                                font.weight: Font.Medium
                                color: nextPageMouse.containsMouse && parent.canNext ? tok.fgOnPrimary : tok.fgVariant
                            }
                            MouseArea {
                                id: nextPageMouse
                                anchors.fill: parent
                                enabled: (win.shellPage + 1) * 4 < shells.length
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                onClicked: if ((win.shellPage + 1) * 4 < shells.length) win.shellPage++
                            }
                        }
                    }

                    // Page indicator
                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        text: (win.shellPage + 1) + " / " + Math.ceil(shells.length / 4)
                        font.pixelSize: 9
                        color: tok.fgMuted
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: 1
                        color: tok.outlineVariant
                        opacity: 0.6
                    }

                    // Left metadata container (animated on shell switch)
                    ColumnLayout {
                        id: leftMetaCol
                        Layout.fillWidth: true
                        spacing: tok.sp2

                        // Tagline
                        Text {
                            text: win.shell.tagline
                            font.pixelSize: 13
                            color: tok.fgVariant
                            wrapMode: Text.Wrap
                            Layout.fillWidth: true
                            lineHeight: 1.4
                        }

                        // Stats grid
                        RowLayout {
                            Layout.fillWidth: true
                            spacing: tok.sp2

                            Rectangle {
                                Layout.fillWidth: true
                                height: 54
                                radius: tok.r2
                                color: tok.bg
                                border.width: 1
                                border.color: tok.outlineVariant
                                ColumnLayout {
                                    anchors.centerIn: parent
                                    spacing: 0
                                    Text {
                                        Layout.alignment: Qt.AlignHCenter
                                        text: win.shell.stars
                                        font.pixelSize: 16
                                        font.weight: Font.Bold
                                        color: tok.primary
                                    }
                                    Text {
                                        Layout.alignment: Qt.AlignHCenter
                                        text: "Étoiles"
                                        font.pixelSize: 10
                                        color: tok.fgMuted
                                    }
                                }
                            }

                            Rectangle {
                                Layout.fillWidth: true
                                height: 54
                                radius: tok.r2
                                color: tok.bg
                                border.width: 1
                                border.color: tok.outlineVariant
                                ColumnLayout {
                                    anchors.centerIn: parent
                                    spacing: 0
                                    Text {
                                        Layout.alignment: Qt.AlignHCenter
                                        text: win.shell.forks
                                        font.pixelSize: 16
                                        font.weight: Font.Bold
                                        color: tok.tertiary
                                    }
                                    Text {
                                        Layout.alignment: Qt.AlignHCenter
                                        text: "Forks"
                                        font.pixelSize: 10
                                        color: tok.fgMuted
                                    }
                                }
                            }

                            Rectangle {
                                Layout.fillWidth: true
                                height: 54
                                radius: tok.r2
                                color: tok.bg
                                border.width: 1
                                border.color: tok.outlineVariant
                                ColumnLayout {
                                    anchors.centerIn: parent
                                    spacing: 2
                                    Text {
                                        Layout.alignment: Qt.AlignHCenter
                                        text: win.shell.license
                                        font.pixelSize: 13
                                        font.weight: Font.Bold
                                        color: tok.fg
                                    }
                                    Text {
                                        Layout.alignment: Qt.AlignHCenter
                                        text: "Licence"
                                        font.pixelSize: 10
                                        color: tok.fgMuted
                                    }
                                }
                            }
                        }

                        // Key features summary
                        ColumnLayout {
                            Layout.fillWidth: true
                            spacing: tok.sp1
                            Text {
                                text: "FONCTIONNALITÉS CLÉS"
                                font.pixelSize: 10
                                font.weight: Font.Bold
                                color: tok.fgMuted
                            }
                            Flow {
                                Layout.fillWidth: true
                                spacing: 6
                                Repeater {
                                    model: win.shell.features
                                    Rectangle {
                                        width: leftFeatText.implicitWidth + tok.sp2 * 2
                                        height: 22
                                        radius: 6
                                        color: tok.bg
                                        border.width: 1
                                        border.color: tok.outlineVariant
                                        Text {
                                            id: leftFeatText
                                            anchors.centerIn: parent
                                            text: modelData
                                            font.pixelSize: 10
                                            color: tok.fgVariant
                                        }
                                    }
                                }
                            }
                        }
                    }

                    Item { Layout.fillHeight: true }

                    // Status Box
                    Rectangle {
                        Layout.fillWidth: true
                        implicitHeight: statusRow.implicitHeight + tok.sp2 * 2
                        radius: tok.r2
                        color: tok.bg
                        border.width: 1
                        border.color: win.busy ? tok.primary : tok.outlineVariant
                        Behavior on border.color { ColorAnimation { duration: tok.animMed } }

                        RowLayout {
                            id: statusRow
                            anchors.fill: parent
                            anchors.margins: tok.sp2
                            spacing: tok.sp2
                            Rectangle {
                                id: statusDot
                                width: 6
                                height: 6
                                radius: 3
                                color: win.busy ? tok.primary : tok.tertiary
                                Layout.alignment: Qt.AlignTop
                                Layout.topMargin: 4
                                Behavior on color { ColorAnimation { duration: tok.animFast } }

                                SequentialAnimation on opacity {
                                    running: win.busy
                                    loops: Animation.Infinite
                                    NumberAnimation { to: 0.25; duration: 400; easing.type: Easing.InOutQuad }
                                    NumberAnimation { to: 1.0; duration: 400; easing.type: Easing.InOutQuad }
                                    onRunningChanged: if (!running) statusDot.opacity = 1.0
                                }
                            }
                            Text {
                                id: statusLabel
                                text: win.statusText
                                font.pixelSize: 11
                                color: tok.fgVariant
                                wrapMode: Text.Wrap
                                Layout.fillWidth: true
                            }
                        }
                    }

                    // Revert to Ryoku Button
                    Rectangle {
                        id: revBtn
                        Layout.fillWidth: true
                        height: 38
                        radius: tok.r3
                        color: revMouse.containsMouse && !win.busy ? tok.surfaceHigh : tok.bg
                        border.width: 1
                        border.color: revMouse.containsMouse && !win.busy ? tok.primary : tok.outlineVariant
                        scale: revMouse.pressed && !win.busy ? 0.97 : (revMouse.containsMouse && !win.busy ? 1.01 : 1.0)
                        visible: win.shell.activatable

                        Behavior on color { ColorAnimation { duration: tok.animFast } }
                        Behavior on border.color { ColorAnimation { duration: tok.animFast } }
                        Behavior on scale { NumberAnimation { duration: tok.animFast; easing.type: Easing.OutQuad } }

                        Text {
                            anchors.centerIn: parent
                            text: win.busy ? "Opération en cours..." : "\u21BA  Revenir à Ryoku"
                            font.pixelSize: 12
                            font.weight: Font.Medium
                            color: win.busy ? tok.fgMuted : tok.fg
                            Behavior on color { ColorAnimation { duration: tok.animFast } }
                        }
                        MouseArea {
                            id: revMouse
                            anchors.fill: parent
                            enabled: !win.busy
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                            onClicked: win.revert()
                        }
                    }

                    // GitHub link
                    Rectangle {
                        Layout.fillWidth: true
                        height: 28
                        radius: tok.r2
                        color: ghLeftMouse.containsMouse ? tok.surfaceHigh : "transparent"
                        clip: true
                        Behavior on color { ColorAnimation { duration: tok.animFast } }

                        RowLayout {
                            anchors.centerIn: parent
                            width: parent.width - tok.sp2 * 2
                            spacing: tok.sp1
                            Text {
                                text: "\u2197"
                                font.pixelSize: 12
                                color: tok.primary
                            }
                            Text {
                                text: win.shell.github
                                font.pixelSize: 11
                                font.weight: Font.Medium
                                color: tok.primary
                                elide: Text.ElideMiddle
                                Layout.fillWidth: true
                            }
                        }
                        MouseArea {
                            id: ghLeftMouse
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                            onClicked: Qt.openUrlExternally(win.shell.github)
                        }
                    }

                    // Video link (if available)
                    Rectangle {
                        Layout.fillWidth: true
                        height: 28
                        radius: tok.r2
                        visible: win.shell.video !== ""
                        color: vidLeftMouse.containsMouse ? tok.surfaceHigh : "transparent"
                        Behavior on color { ColorAnimation { duration: tok.animFast } }

                        RowLayout {
                            anchors.centerIn: parent
                            spacing: tok.sp1
                            Text {
                                text: "\u25B6"
                                font.pixelSize: 12
                                color: tok.tertiary
                            }

                    // Disclaimer
                    Text {
                        text: "Projet experimental. L'activation d'un shell peut modifier votre configuration. Assurez-vous d'avoir des sauvegardes."
                        font.pixelSize: 10
                        color: tok.fgMuted
                        wrapMode: Text.Wrap
                        Layout.fillWidth: true
                        font.italic: true
                    }
                }
                            Text {
                                text: "Vidéo de démonstration"
                                font.pixelSize: 11
                                font.weight: Font.Medium
                                color: tok.tertiary
                            }
                        }
                        MouseArea {
                            id: vidLeftMouse
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                            onClicked: Qt.openUrlExternally(win.shell.video)
                        }
                    }
                }
            }

            // ================= RIGHT PANEL (FILL) =================
            ColumnLayout {
                id: rightPanelContainer
                Layout.fillWidth: true
                Layout.fillHeight: true
                spacing: tok.sp3
                transform: Translate { id: rightPanelTrans; y: 0 }

                // Featured Image Container (Large)
                Rectangle {
                    id: featuredCard
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    radius: tok.r4
                    color: tok.surface
                    border.width: 1
                    border.color: featMouse.containsMouse ? tok.primary : tok.outlineVariant
                    clip: true
                    Behavior on border.color { ColorAnimation { duration: tok.animFast } }

                    Image {
                        anchors.fill: parent
                        anchors.margins: tok.sp3
                        source: win.shell.featured
                        fillMode: Image.PreserveAspectFit
                        sourceSize: Qt.size(800, 600)
                        asynchronous: true
                        cache: true
                        opacity: status === Image.Ready ? 1.0 : 0.0
                        scale: featMouse.containsMouse ? 1.015 : 1.0
                        Behavior on opacity { NumberAnimation { duration: tok.animSlow; easing.type: Easing.OutCubic } }
                        Behavior on scale { NumberAnimation { duration: tok.animSlow; easing.type: Easing.OutCubic } }
                    }

                    // Top-left shell badge overlay
                    Rectangle {
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.margins: tok.sp3
                        width: badgeRow.implicitWidth + tok.sp3 * 2
                        height: 30
                        radius: 15
                        color: Qt.rgba(15/255, 20/255, 23/255, 0.85)
                        border.width: 1
                        border.color: tok.outlineVariant
                        RowLayout {
                            id: badgeRow
                            anchors.centerIn: parent
                            spacing: tok.sp2
                            Text {
                                text: win.shell.name
                                font.pixelSize: 12
                                font.weight: Font.Bold
                                color: tok.fg
                            }
                            Text {
                                text: "\u2022  Aperçu principal"
                                font.pixelSize: 11
                                color: tok.fgMuted
                            }
                        }
                    }

                    // Bottom-right zoom hint pill
                    Rectangle {
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                        anchors.margins: tok.sp3
                        width: zoomHintText.implicitWidth + tok.sp3 * 2
                        height: 28
                        radius: 14
                        color: featMouse.containsMouse ? tok.primary : Qt.rgba(15/255, 20/255, 23/255, 0.85)
                        border.width: 1
                        border.color: featMouse.containsMouse ? tok.primary : tok.outlineVariant
                        scale: featMouse.containsMouse ? 1.04 : 1.0
                        Behavior on color { ColorAnimation { duration: tok.animFast } }
                        Behavior on border.color { ColorAnimation { duration: tok.animFast } }
                        Behavior on scale { NumberAnimation { duration: tok.animFast; easing.type: Easing.OutQuad } }

                        Text {
                            id: zoomHintText
                            anchors.centerIn: parent
                            text: "\uD83D\uDD0D Cliquer pour agrandir"
                            font.pixelSize: 11
                            font.weight: Font.Medium
                            color: featMouse.containsMouse ? tok.fgOnPrimary : tok.fgVariant
                            Behavior on color { ColorAnimation { duration: tok.animFast } }
                        }
                    }

                    MouseArea {
                        id: featMouse
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: win.openLightbox(win.shell.featured)
                    }
                }

                // Thumbnails Strip
                RowLayout {
                    Layout.fillWidth: true
                    spacing: tok.sp3
                    Repeater {
                        model: win.shell.thumbs
                        Rectangle {
                            Layout.fillWidth: true
                            height: 136
                            radius: tok.r3
                            color: tok.surface
                            border.width: 1
                            border.color: thumbMouse.containsMouse ? tok.primary : tok.outlineVariant
                            scale: thumbMouse.pressed ? 0.97 : (thumbMouse.containsMouse ? 1.015 : 1.0)
                            clip: true

                            Behavior on border.color { ColorAnimation { duration: tok.animFast } }
                            Behavior on scale { NumberAnimation { duration: tok.animFast; easing.type: Easing.OutQuad } }

                            Image {
                                anchors.fill: parent
                                anchors.margins: tok.sp2
                                source: modelData
                                fillMode: Image.PreserveAspectFit
                                sourceSize: Qt.size(320, 160)
                                asynchronous: true
                                cache: true
                                opacity: status === Image.Ready ? 1.0 : 0.0
                                scale: thumbMouse.containsMouse ? 1.03 : 1.0
                                Behavior on opacity { NumberAnimation { duration: tok.animSlow; easing.type: Easing.OutCubic } }
                                Behavior on scale { NumberAnimation { duration: tok.animSlow; easing.type: Easing.OutCubic } }
                            }

                            Rectangle {
                                anchors.bottom: parent.bottom
                                anchors.right: parent.right
                                anchors.margins: tok.sp2
                                width: 24
                                height: 24
                                radius: 12
                                opacity: thumbMouse.containsMouse ? 1.0 : 0.0
                                scale: thumbMouse.containsMouse ? 1.0 : 0.6
                                color: tok.primary
                                Behavior on opacity { NumberAnimation { duration: tok.animFast } }
                                Behavior on scale { NumberAnimation { duration: tok.animFast; easing.type: Easing.OutBack } }

                                Text {
                                    anchors.centerIn: parent
                                    text: "+"
                                    font.pixelSize: 15
                                    font.weight: Font.Bold
                                    color: tok.fgOnPrimary
                                }
                            }

                            MouseArea {
                                id: thumbMouse
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                onClicked: win.openLightbox(modelData)
                            }
                        }
                    }
                }

                // Details & Action Card
                Rectangle {
                    Layout.fillWidth: true
                    implicitHeight: detailsCol.implicitHeight + tok.sp4 * 2
                    radius: tok.r4
                    color: tok.surface
                    border.width: 1
                    border.color: tok.outlineVariant

                    ColumnLayout {
                        id: detailsCol
                        anchors.fill: parent
                        anchors.margins: tok.sp4
                        spacing: tok.sp3

                        // Top action row: Title + Activate CTA button
                        RowLayout {
                            Layout.fillWidth: true
                            spacing: tok.sp4

                            ColumnLayout {
                                Layout.fillWidth: true
                                spacing: 2
                                Text {
                                    text: win.shell.name
                                    font.pixelSize: 18
                                    font.weight: Font.Bold
                                    color: tok.fg
                                    elide: Text.ElideRight
                                    Layout.fillWidth: true
                                }
                                Text {
                                    text: win.shell.bio
                                    font.pixelSize: 12
                                    color: tok.fgVariant
                                    wrapMode: Text.Wrap
                                    Layout.fillWidth: true
                                    lineHeight: 1.35
                                }
                            }

                            Rectangle {
                                Layout.preferredWidth: 230
                                Layout.preferredHeight: 44
                                radius: tok.r3
                                color: win.busy ? tok.surfaceHigh : (actMouse.containsMouse ? "#a6dcfa" : tok.primary)
                                border.width: win.busy ? 1 : 0
                                border.color: tok.outlineVariant
                                scale: actMouse.pressed && !win.busy ? 0.96 : (actMouse.containsMouse && !win.busy ? 1.02 : 1.0)
                                clip: true

                                Behavior on color { ColorAnimation { duration: tok.animFast } }
                                Behavior on scale { NumberAnimation { duration: tok.animFast; easing.type: Easing.OutQuad } }

                                Text {
                                    anchors.centerIn: parent
                                    width: parent.width - tok.sp3 * 2
                                    horizontalAlignment: Text.AlignHCenter
                                    elide: Text.ElideRight
                                    text: win.busy ? "Exécution..." : "Activer " + win.shell.name
                                    font.pixelSize: 13
                                    font.weight: Font.Bold
                                    color: win.busy ? tok.fgVariant : tok.fgOnPrimary
                                    Behavior on color { ColorAnimation { duration: tok.animFast } }
                                }
                                MouseArea {
                                    id: actMouse
                                    anchors.fill: parent
                                    enabled: !win.busy
                                    hoverEnabled: true
                                    cursorShape: Qt.PointingHandCursor
                                    onClicked: win.activate()
                                }
                            }
                        }

                        // Features pills row
                        Flow {
                            Layout.fillWidth: true
                            spacing: tok.sp2
                            Repeater {
                                model: win.shell.features
                                Rectangle {
                                    width: ft.implicitWidth + tok.sp3 * 2
                                    height: 26
                                    radius: 13
                                    color: tok.surfaceHigh
                                    border.width: 1
                                    border.color: tok.outlineVariant
                                    Text {
                                        id: ft
                                        anchors.centerIn: parent
                                        text: modelData
                                        font.pixelSize: 11
                                        font.weight: Font.Medium
                                        color: tok.primary
                                    }
                                }
                            }
                        }

                        // Prerequisites bar
                        Rectangle {
                            Layout.fillWidth: true
                            implicitHeight: prereqRow.implicitHeight + tok.sp2 * 2
                            radius: tok.r2
                            color: tok.bg
                            border.width: 1
                            border.color: tok.outlineVariant
                            RowLayout {
                                id: prereqRow
                                anchors.fill: parent
                                anchors.margins: tok.sp2
                                spacing: tok.sp2
                                Rectangle {
                                    Layout.preferredWidth: prereqLabel.implicitWidth + tok.sp2 * 2
                                    Layout.preferredHeight: 20
                                    radius: 4
                                    color: tok.surfaceHigh
                                    Text {
                                        id: prereqLabel
                                        anchors.centerIn: parent
                                        text: "PRÉREQUIS"
                                        font.pixelSize: 10
                                        font.weight: Font.Bold
                                        color: tok.tertiary
                                    }
                                }
                                Text {
                                    text: win.shell.prereqs
                                    font.pixelSize: 11
                                    color: tok.fgMuted
                                    wrapMode: Text.Wrap
                                    Layout.fillWidth: true
                                }
                            }
                        }
                    }
                }
            }
        }

        // ================= SETTINGS OVERLAY (ANIMATED) =================
        Rectangle {
            id: settingsOverlay
            anchors.fill: parent
            color: Qt.rgba(0, 0, 0, 0.85)
            opacity: win.settingsOpen ? 1.0 : 0.0
            visible: opacity > 0.01
            z: 998
            focus: win.settingsOpen
            onVisibleChanged: if (win.settingsOpen) forceActiveFocus()
            Keys.onEscapePressed: win.settingsOpen = false
            Behavior on opacity { NumberAnimation { duration: tok.animMed; easing.type: Easing.OutCubic } }

            MouseArea {
                anchors.fill: parent
                enabled: win.settingsOpen
                onClicked: win.settingsOpen = false
            }

            Rectangle {
                anchors.centerIn: parent
                width: 420
                height: settingsCol.implicitHeight + tok.sp5 * 2
                radius: tok.r4
                color: tok.surface
                border.width: 1
                border.color: tok.outlineVariant
                scale: win.settingsOpen ? 1.0 : 0.92
                clip: true
                Behavior on scale { NumberAnimation { duration: tok.animMed; easing.type: Easing.OutBack } }

                MouseArea {
                    anchors.fill: parent
                }

                ColumnLayout {
                    id: settingsCol
                    anchors.fill: parent
                    anchors.margins: tok.sp5
                    spacing: tok.sp4

                    RowLayout {
                        Layout.fillWidth: true
                        spacing: tok.sp2
                        Rectangle {
                            width: 8
                            height: 20
                            radius: 4
                            color: tok.primary
                        }
                        Text {
                            text: "\u2699  Paramètres"
                            font.pixelSize: 18
                            font.weight: Font.Bold
                            color: tok.fg
                            Layout.fillWidth: true
                        }
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        implicitHeight: settingsMsgCol.implicitHeight + tok.sp4 * 2
                        radius: tok.r3
                        color: tok.bg
                        border.width: 1
                        border.color: tok.outlineVariant

                        ColumnLayout {
                            id: settingsMsgCol
                            anchors.fill: parent
                            anchors.margins: tok.sp4
                            spacing: tok.sp2

                            Text {
                                text: "Paramètres bientôt disponibles"
                                font.pixelSize: 14
                                font.weight: Font.Bold
                                color: tok.primary
                                wrapMode: Text.Wrap
                                Layout.fillWidth: true
                            }
                            Text {
                                text: "Les options de personnalisation du cache d'aperçus, du comportement au lancement et des scripts seront ajoutées dans une prochaine mise à jour."
                                font.pixelSize: 12
                                color: tok.fgVariant
                                wrapMode: Text.Wrap
                                Layout.fillWidth: true
                                lineHeight: 1.35
                            }
                        }
                    }

                    RowLayout {
                        Layout.fillWidth: true
                        spacing: tok.sp3

                        Rectangle {
                            Layout.fillWidth: true
                            height: 38
                            radius: tok.r2
                            color: replayTutMouse.containsMouse ? tok.bg : tok.surfaceHigh
                            border.width: 1
                            border.color: replayTutMouse.containsMouse ? tok.primary : tok.outlineVariant
                            scale: replayTutMouse.pressed ? 0.96 : 1.0
                            Behavior on color { ColorAnimation { duration: tok.animFast } }
                            Behavior on border.color { ColorAnimation { duration: tok.animFast } }
                            Behavior on scale { NumberAnimation { duration: tok.animFast } }

                            Text {
                                anchors.centerIn: parent
                                text: "Revoir le tutoriel"
                                font.pixelSize: 12
                                font.weight: Font.Medium
                                color: tok.fgVariant
                            }
                            MouseArea {
                                id: replayTutMouse
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    win.settingsOpen = false
                                    win.tutorialStep = 0
                                    win.tutorialOpen = true
                                }
                            }
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            height: 38
                            radius: tok.r2
                            color: closeSetMouse.containsMouse ? "#a6dcfa" : tok.primary
                            scale: closeSetMouse.pressed ? 0.96 : 1.0
                            Behavior on color { ColorAnimation { duration: tok.animFast } }
                            Behavior on scale { NumberAnimation { duration: tok.animFast } }

                            Text {
                                anchors.centerIn: parent
                                text: "Fermer"
                                font.pixelSize: 13
                                font.weight: Font.Bold
                                color: tok.fgOnPrimary
                            }
                            MouseArea {
                                id: closeSetMouse
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                onClicked: win.settingsOpen = false
                            }
                        }
                    }
                }
            }
        }

        // ================= END-4 CONFIRMATION OVERLAY (ANIMATED) =================
        Rectangle {
            id: end4Overlay
            anchors.fill: parent
            color: Qt.rgba(0, 0, 0, 0.85)
            opacity: win.confirmEnd4 ? 1.0 : 0.0
            visible: opacity > 0.01
            z: 999
            Behavior on opacity { NumberAnimation { duration: tok.animMed; easing.type: Easing.OutCubic } }

            MouseArea {
                anchors.fill: parent
                enabled: win.confirmEnd4
                onClicked: win.cancelEnd4Activate()
            }
            Rectangle {
                anchors.centerIn: parent
                width: 440
                height: confirmCol.implicitHeight + tok.sp5 * 2
                radius: tok.r4
                color: tok.surface
                border.width: 1
                border.color: tok.outlineVariant
                scale: win.confirmEnd4 ? 1.0 : 0.92
                Behavior on scale { NumberAnimation { duration: tok.animMed; easing.type: Easing.OutBack } }

                MouseArea {
                    anchors.fill: parent
                }

                ColumnLayout {
                    id: confirmCol
                    anchors.fill: parent
                    anchors.margins: tok.sp5
                    spacing: tok.sp4

                    RowLayout {
                        Layout.fillWidth: true
                        spacing: tok.sp2
                        Rectangle {
                            width: 10
                            height: 22
                            radius: 5
                            color: tok.primary
                        }
                        Text {
                            text: "Installer end-4 (illogical-impulse) ?"
                            font.pixelSize: 18
                            font.weight: Font.Bold
                            color: tok.fg
                            Layout.fillWidth: true
                        }
                    }

                    Text {
                        text: "end-4 (illogical-impulse) est un ensemble complet de dotfiles qui remplacera votre configuration Hyprland et Quickshell. Une sauvegarde complète de Ryoku sera créée automatiquement avant l'installation."
                        font.pixelSize: 13
                        color: tok.fgVariant
                        wrapMode: Text.Wrap
                        Layout.fillWidth: true
                        lineHeight: 1.4
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        implicitHeight: termNote.implicitHeight + tok.sp3 * 2
                        radius: tok.r2
                        color: tok.bg
                        border.width: 1
                        border.color: tok.outlineVariant
                        Text {
                            id: termNote
                            anchors.fill: parent
                            anchors.margins: tok.sp3
                            text: "L'installateur interactif s'ouvrira dans un terminal externe. Suivez les instructions affichées à l'écran."
                            font.pixelSize: 12
                            color: tok.fgMuted
                            wrapMode: Text.Wrap
                        }
                    }

                    RowLayout {
                        Layout.fillWidth: true
                        spacing: tok.sp3
                        Rectangle {
                            Layout.fillWidth: true
                            height: 40
                            radius: tok.r2
                            color: cancelBtnMouse.containsMouse ? tok.bg : tok.surfaceHigh
                            border.width: 1
                            border.color: tok.outlineVariant
                            scale: cancelBtnMouse.pressed ? 0.96 : 1.0
                            Behavior on color { ColorAnimation { duration: tok.animFast } }
                            Behavior on scale { NumberAnimation { duration: tok.animFast } }

                            Text {
                                anchors.centerIn: parent
                                text: "Annuler"
                                font.pixelSize: 13
                                font.weight: Font.Medium
                                color: tok.fg
                            }
                            MouseArea {
                                id: cancelBtnMouse
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                onClicked: win.cancelEnd4Activate()
                            }
                        }
                        Rectangle {
                            Layout.fillWidth: true
                            height: 40
                            radius: tok.r2
                            color: confirmBtnMouse.containsMouse ? "#a6dcfa" : tok.primary
                            scale: confirmBtnMouse.pressed ? 0.96 : 1.0
                            Behavior on color { ColorAnimation { duration: tok.animFast } }
                            Behavior on scale { NumberAnimation { duration: tok.animFast } }

                            Text {
                                anchors.centerIn: parent
                                text: "Sauvegarder & Installer"
                                font.pixelSize: 13
                                font.weight: Font.Bold
                                color: tok.fgOnPrimary
                            }
                            MouseArea {
                                id: confirmBtnMouse
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                onClicked: win.confirmEnd4Activate()
                            }
                        }
                    }
                }
            }
        }

        // ================= LIGHTBOX OVERLAY (ANIMATED) =================
        Rectangle {
            id: lightboxOverlay
            anchors.fill: parent
            color: Qt.rgba(0, 0, 0, 0.92)
            opacity: win.lightboxOpen ? 1.0 : 0.0
            visible: opacity > 0.01
            z: 1000
            focus: win.lightboxOpen
            onVisibleChanged: if (win.lightboxOpen) forceActiveFocus()
            Keys.onEscapePressed: win.closeLightbox()
            Behavior on opacity { NumberAnimation { duration: tok.animMed; easing.type: Easing.OutCubic } }

            MouseArea {
                anchors.fill: parent
                enabled: win.lightboxOpen
                onClicked: win.closeLightbox()
            }

            Item {
                id: lbContainer
                anchors.centerIn: parent
                width: parent.width * 0.92
                height: parent.height * 0.88
                scale: win.lightboxOpen ? 1.0 : 0.95
                Behavior on scale { NumberAnimation { duration: tok.animMed; easing.type: Easing.OutCubic } }

                Image {
                    id: lbImage
                    x: (lbContainer.width - width) / 2 + win.lightboxPanX
                    y: (lbContainer.height - height) / 2 + win.lightboxPanY
                    width: lbContainer.width
                    height: lbContainer.height
                    source: win.lightboxSource
                    fillMode: Image.PreserveAspectFit
                    sourceSize: Qt.size(1920, 1080)
                    asynchronous: true
                    cache: true
                    opacity: status === Image.Ready ? 1.0 : 0.0
                    scale: win.lightboxZoom
                    transformOrigin: Item.Center
                    Behavior on opacity { NumberAnimation { duration: tok.animMed } }
                }

                MouseArea {
                    id: lbMouse
                    anchors.fill: parent
                    enabled: win.lightboxOpen
                    acceptedButtons: Qt.LeftButton
                    cursorShape: pressed ? Qt.ClosedHandCursor : Qt.OpenHandCursor
                    property real lastX: 0
                    property real lastY: 0
                    onWheel: (wheel) => {
                        var factor = wheel.angleDelta.y > 0 ? 1.15 : 1 / 1.15
                        var newZoom = Math.max(0.5, Math.min(6.0, win.lightboxZoom * factor))
                        if (Math.abs(newZoom - 1.0) < 0.05) {
                            newZoom = 1.0
                            win.lightboxPanX = 0
                            win.lightboxPanY = 0
                        }
                        win.lightboxZoom = newZoom
                    }
                    onPressed: (mouse) => { lastX = mouse.x; lastY = mouse.y }
                    onPositionChanged: (mouse) => {
                        win.lightboxPanX += mouse.x - lastX
                        win.lightboxPanY += mouse.y - lastY
                        lastX = mouse.x
                        lastY = mouse.y
                    }
                    onDoubleClicked: {
                        win.lightboxZoom = 1.0
                        win.lightboxPanX = 0
                        win.lightboxPanY = 0
                    }
                }
            }

            // Close button (top-right)
            Rectangle {
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.margins: tok.sp4
                width: 42
                height: 42
                radius: 21
                color: closeLbMouse.containsMouse ? tok.primary : tok.surfaceHigh
                border.width: 1
                border.color: tok.outlineVariant
                scale: closeLbMouse.pressed ? 0.92 : (closeLbMouse.containsMouse ? 1.06 : 1.0)
                Behavior on color { ColorAnimation { duration: tok.animFast } }
                Behavior on scale { NumberAnimation { duration: tok.animFast; easing.type: Easing.OutQuad } }

                Text {
                    anchors.centerIn: parent
                    text: "\u00D7"
                    font.pixelSize: 22
                    font.weight: Font.Bold
                    color: closeLbMouse.containsMouse ? tok.fgOnPrimary : tok.fg
                }
                MouseArea {
                    id: closeLbMouse
                    anchors.fill: parent
                    enabled: win.lightboxOpen
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: win.closeLightbox()
                }
            }

            // Bottom floating HUD bar
            Rectangle {
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottomMargin: tok.sp4
                width: lbHelpRow.implicitWidth + tok.sp4 * 2
                height: 34
                radius: 17
                color: tok.surface
                border.width: 1
                border.color: tok.outlineVariant

                RowLayout {
                    id: lbHelpRow
                    anchors.centerIn: parent
                    spacing: tok.sp3
                    Text {
                        text: "Zoom : " + Math.round(win.lightboxZoom * 100) + "%"
                        font.pixelSize: 11
                        font.weight: Font.Bold
                        color: tok.primary
                    }
                    Text {
                        text: "|   Molette : zoom   |   Glisser : déplacer   |   Double-clic : réinitialiser   |   Échap : fermer"
                        font.pixelSize: 11
                        color: tok.fgVariant
                    }
                }
            }
        }

        // ================= INTERACTIVE TUTORIAL OVERLAY (7 STEPS, ANIMATED) =================
        Rectangle {
            id: tutorialOverlay
            anchors.fill: parent
            color: Qt.rgba(0, 0, 0, 0.88)
            opacity: win.tutorialOpen ? 1.0 : 0.0
            visible: opacity > 0.01
            z: 1001
            focus: win.tutorialOpen
            onVisibleChanged: if (win.tutorialOpen) forceActiveFocus()
            Keys.onEscapePressed: win.completeTutorial()
            Keys.onRightPressed: win.goToTutorialStep(win.tutorialStep + 1)
            Keys.onLeftPressed: win.goToTutorialStep(win.tutorialStep - 1)
            Behavior on opacity { NumberAnimation { duration: tok.animSlow; easing.type: Easing.OutCubic } }

            // Directional step transition animation
            ParallelAnimation {
                id: tutStepAnim
                NumberAnimation {
                    target: tutStepBody
                    property: "opacity"
                    from: 0.0
                    to: 1.0
                    duration: 210
                    easing.type: Easing.OutCubic
                }
                NumberAnimation {
                    target: tutStepTrans
                    property: "x"
                    from: win.tutorialDirection * 24
                    to: 0
                    duration: 230
                    easing.type: Easing.OutCubic
                }
                NumberAnimation {
                    target: tutIconBadge
                    property: "scale"
                    from: 0.75
                    to: 1.0
                    duration: 260
                    easing.type: Easing.OutBack
                }
            }

            // Block background clicks from leaking through
            MouseArea {
                anchors.fill: parent
                enabled: win.tutorialOpen
            }

            Rectangle {
                id: tutCard
                anchors.centerIn: parent
                width: Math.min(560, parent.width - tok.sp6 * 2)
                height: tutCardCol.implicitHeight + tok.sp5 * 2
                radius: tok.r4
                color: tok.surface
                border.width: 1
                border.color: tok.primary
                scale: win.tutorialOpen ? 1.0 : 0.92
                clip: true

                Behavior on scale { NumberAnimation { duration: tok.animSlow; easing.type: Easing.OutBack } }
                Behavior on height { NumberAnimation { duration: 160; easing.type: Easing.OutCubic } }

                // Top animated progress bar
                Rectangle {
                    anchors.top: parent.top
                    anchors.left: parent.left
                    height: 3
                    width: parent.width * ((win.tutorialStep + 1) / tutorialSteps.length)
                    color: win.tutorialStep === tutorialSteps.length - 1 ? tok.tertiary : tok.primary
                    Behavior on width { NumberAnimation { duration: tok.animMed; easing.type: Easing.OutCubic } }
                    Behavior on color { ColorAnimation { duration: tok.animMed } }
                }

                ColumnLayout {
                    id: tutCardCol
                    anchors.fill: parent
                    anchors.margins: tok.sp5
                    spacing: tok.sp4

                    // Top bar: Step icon + badge + Skip button
                    RowLayout {
                        Layout.fillWidth: true
                        spacing: tok.sp2

                        Rectangle {
                            id: tutIconBadge
                            Layout.preferredWidth: 32
                            Layout.preferredHeight: 32
                            radius: 10
                            color: tok.surfaceHigh
                            border.width: 1
                            border.color: tok.primary
                            Text {
                                anchors.centerIn: parent
                                text: tutorialSteps[win.tutorialStep].icon
                                font.pixelSize: 15
                                font.weight: Font.Bold
                                color: tok.primary
                            }
                        }

                        Rectangle {
                            Layout.preferredWidth: stepBadgeText.implicitWidth + tok.sp3 * 2
                            Layout.preferredHeight: 24
                            radius: 12
                            color: tok.surfaceHigh
                            border.width: 1
                            border.color: tok.outlineVariant
                            Behavior on Layout.preferredWidth { NumberAnimation { duration: tok.animFast; easing.type: Easing.OutCubic } }

                            Text {
                                id: stepBadgeText
                                anchors.centerIn: parent
                                text: tutorialSteps[win.tutorialStep].badge
                                font.pixelSize: 10
                                font.weight: Font.Bold
                                color: tok.primary
                            }
                        }

                        Item { Layout.fillWidth: true }

                        Rectangle {
                            Layout.preferredWidth: skipBtnText.implicitWidth + tok.sp3 * 2
                            Layout.preferredHeight: 26
                            radius: tok.r2
                            color: skipMouse.containsMouse ? tok.surfaceHigh : "transparent"
                            border.width: 1
                            border.color: skipMouse.containsMouse ? tok.outline : tok.outlineVariant
                            scale: skipMouse.pressed ? 0.95 : 1.0
                            Behavior on color { ColorAnimation { duration: tok.animFast } }
                            Behavior on border.color { ColorAnimation { duration: tok.animFast } }
                            Behavior on scale { NumberAnimation { duration: tok.animFast } }

                            Text {
                                id: skipBtnText
                                anchors.centerIn: parent
                                text: "Passer le tutoriel"
                                font.pixelSize: 11
                                font.weight: Font.Medium
                                color: skipMouse.containsMouse ? tok.fg : tok.fgMuted
                                Behavior on color { ColorAnimation { duration: tok.animFast } }
                            }
                            MouseArea {
                                id: skipMouse
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                onClicked: win.completeTutorial()
                            }
                        }
                    }

                    // Animated Step Content Body
                    ColumnLayout {
                        id: tutStepBody
                        Layout.fillWidth: true
                        spacing: tok.sp3
                        transform: Translate { id: tutStepTrans; x: 0 }

                        // Step Title
                        Text {
                            text: tutorialSteps[win.tutorialStep].title
                            font.pixelSize: 22
                            font.weight: Font.Bold
                            color: tok.fg
                            wrapMode: Text.Wrap
                            Layout.fillWidth: true
                        }

                        // Step Description
                        Text {
                            text: tutorialSteps[win.tutorialStep].desc
                            font.pixelSize: 14
                            color: tok.fgVariant
                            wrapMode: Text.Wrap
                            Layout.fillWidth: true
                            lineHeight: 1.45
                        }

                        // Step Hint Box
                        Rectangle {
                            Layout.fillWidth: true
                            implicitHeight: tutHintRow.implicitHeight + tok.sp3 * 2
                            radius: tok.r3
                            color: tok.bg
                            border.width: 1
                            border.color: tok.outlineVariant

                            RowLayout {
                                id: tutHintRow
                                anchors.fill: parent
                                anchors.margins: tok.sp3
                                spacing: tok.sp3

                                Rectangle {
                                    width: 6
                                    height: 28
                                    radius: 3
                                    color: tok.tertiary
                                }

                                Text {
                                    text: tutorialSteps[win.tutorialStep].hint
                                    font.pixelSize: 12
                                    color: tok.fgMuted
                                    wrapMode: Text.Wrap
                                    Layout.fillWidth: true
                                    lineHeight: 1.35
                                }
                            }
                        }
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: 1
                        color: tok.outlineVariant
                        opacity: 0.5
                    }

                    // Bottom bar: Animated Progress dots + Précédent / Suivant / Terminer buttons
                    RowLayout {
                        Layout.fillWidth: true
                        spacing: tok.sp3

                        // Progress dots
                        RowLayout {
                            spacing: 6
                            Repeater {
                                model: tutorialSteps.length
                                Rectangle {
                                    property bool active: index === win.tutorialStep
                                    property bool passed: index < win.tutorialStep
                                    width: active ? 24 : 8
                                    height: 8
                                    radius: 4
                                    color: active ? tok.primary : (passed ? tok.tertiary : tok.surfaceHigh)
                                    border.width: active ? 0 : 1
                                    border.color: tok.outlineVariant
                                    scale: dotMouse.containsMouse && !active ? 1.25 : 1.0

                                    Behavior on width { NumberAnimation { duration: tok.animMed; easing.type: Easing.OutBack } }
                                    Behavior on color { ColorAnimation { duration: tok.animFast } }
                                    Behavior on scale { NumberAnimation { duration: tok.animFast } }

                                    MouseArea {
                                        id: dotMouse
                                        anchors.fill: parent
                                        hoverEnabled: true
                                        cursorShape: Qt.PointingHandCursor
                                        onClicked: win.goToTutorialStep(index)
                                    }
                                }
                            }
                        }

                        Item { Layout.fillWidth: true }

                        // Précédent button
                        Rectangle {
                            property bool canPrev: win.tutorialStep > 0
                            Layout.preferredWidth: 110
                            Layout.preferredHeight: 38
                            radius: tok.r2
                            color: prevTutMouse.containsMouse && canPrev ? tok.bg : tok.surfaceHigh
                            border.width: 1
                            border.color: prevTutMouse.containsMouse && canPrev ? tok.outline : tok.outlineVariant
                            opacity: canPrev ? 1.0 : 0.4
                            scale: prevTutMouse.pressed && canPrev ? 0.96 : 1.0

                            Behavior on color { ColorAnimation { duration: tok.animFast } }
                            Behavior on border.color { ColorAnimation { duration: tok.animFast } }
                            Behavior on opacity { NumberAnimation { duration: tok.animFast } }
                            Behavior on scale { NumberAnimation { duration: tok.animFast } }

                            Text {
                                anchors.centerIn: parent
                                text: "Précédent"
                                font.pixelSize: 13
                                font.weight: Font.Medium
                                color: tok.fg
                            }
                            MouseArea {
                                id: prevTutMouse
                                anchors.fill: parent
                                enabled: win.tutorialStep > 0
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                onClicked: win.goToTutorialStep(win.tutorialStep - 1)
                            }
                        }

                        // Suivant / Terminer button
                        Rectangle {
                            readonly property bool isLastStep: win.tutorialStep === tutorialSteps.length - 1
                            Layout.preferredWidth: 130
                            Layout.preferredHeight: 38
                            radius: tok.r2
                            color: nextTutMouse.containsMouse ? "#a6dcfa" : (isLastStep ? tok.tertiary : tok.primary)
                            scale: nextTutMouse.pressed ? 0.96 : (nextTutMouse.containsMouse ? 1.02 : 1.0)

                            Behavior on color { ColorAnimation { duration: tok.animFast } }
                            Behavior on scale { NumberAnimation { duration: tok.animFast; easing.type: Easing.OutQuad } }

                            Text {
                                anchors.centerIn: parent
                                text: parent.isLastStep ? "Terminer" : "Suivant"
                                font.pixelSize: 13
                                font.weight: Font.Bold
                                color: tok.fgOnPrimary
                            }
                            MouseArea {
                                id: nextTutMouse
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    if (win.tutorialStep < tutorialSteps.length - 1) {
                                        win.goToTutorialStep(win.tutorialStep + 1)
                                    } else {
                                        win.completeTutorial()
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
