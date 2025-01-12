if not game:IsLoaded() then
	repeat task.wait(0.1) until game:IsLoaded()
end

local lib = {}
local lucide = {
	["lucide-accessibility"] = "rbxassetid://10709751939",
	["lucide-activity"] = "rbxassetid://10709752035",
	["lucide-air-vent"] = "rbxassetid://10709752131",
	["lucide-airplay"] = "rbxassetid://10709752254",
	["lucide-alarm-check"] = "rbxassetid://10709752405",
	["lucide-alarm-clock"] = "rbxassetid://10709752630",
	["lucide-alarm-clock-off"] = "rbxassetid://10709752508",
	["lucide-alarm-minus"] = "rbxassetid://10709752732",
	["lucide-alarm-plus"] = "rbxassetid://10709752825",
	["lucide-album"] = "rbxassetid://10709752906",
	["lucide-alert-circle"] = "rbxassetid://10709752996",
	["lucide-alert-octagon"] = "rbxassetid://10709753064",
	["lucide-alert-triangle"] = "rbxassetid://10709753149",
	["lucide-align-center"] = "rbxassetid://10709753570",
	["lucide-align-center-horizontal"] = "rbxassetid://10709753272",
	["lucide-align-center-vertical"] = "rbxassetid://10709753421",
	["lucide-align-end-horizontal"] = "rbxassetid://10709753692",
	["lucide-align-end-vertical"] = "rbxassetid://10709753808",
	["lucide-align-horizontal-distribute-center"] = "rbxassetid://10747779791",
	["lucide-align-horizontal-distribute-end"] = "rbxassetid://10747784534",
	["lucide-align-horizontal-distribute-start"] = "rbxassetid://10709754118",
	["lucide-align-horizontal-justify-center"] = "rbxassetid://10709754204",
	["lucide-align-horizontal-justify-end"] = "rbxassetid://10709754317",
	["lucide-align-horizontal-justify-start"] = "rbxassetid://10709754436",
	["lucide-align-horizontal-space-around"] = "rbxassetid://10709754590",
	["lucide-align-horizontal-space-between"] = "rbxassetid://10709754749",
	["lucide-align-justify"] = "rbxassetid://10709759610",
	["lucide-align-left"] = "rbxassetid://10709759764",
	["lucide-align-right"] = "rbxassetid://10709759895",
	["lucide-align-start-horizontal"] = "rbxassetid://10709760051",
	["lucide-align-start-vertical"] = "rbxassetid://10709760244",
	["lucide-align-vertical-distribute-center"] = "rbxassetid://10709760351",
	["lucide-align-vertical-distribute-end"] = "rbxassetid://10709760434",
	["lucide-align-vertical-distribute-start"] = "rbxassetid://10709760612",
	["lucide-align-vertical-justify-center"] = "rbxassetid://10709760814",
	["lucide-align-vertical-justify-end"] = "rbxassetid://10709761003",
	["lucide-align-vertical-justify-start"] = "rbxassetid://10709761176",
	["lucide-align-vertical-space-around"] = "rbxassetid://10709761324",
	["lucide-align-vertical-space-between"] = "rbxassetid://10709761434",
	["lucide-anchor"] = "rbxassetid://10709761530",
	["lucide-angry"] = "rbxassetid://10709761629",
	["lucide-annoyed"] = "rbxassetid://10709761722",
	["lucide-aperture"] = "rbxassetid://10709761813",
	["lucide-apple"] = "rbxassetid://10709761889",
	["lucide-archive"] = "rbxassetid://10709762233",
	["lucide-archive-restore"] = "rbxassetid://10709762058",
	["lucide-armchair"] = "rbxassetid://10709762327",
	["lucide-arrow-big-down"] = "rbxassetid://10747796644",
	["lucide-arrow-big-left"] = "rbxassetid://10709762574",
	["lucide-arrow-big-right"] = "rbxassetid://10709762727",
	["lucide-arrow-big-up"] = "rbxassetid://10709762879",
	["lucide-arrow-down"] = "rbxassetid://10709767827",
	["lucide-arrow-down-circle"] = "rbxassetid://10709763034",
	["lucide-arrow-down-left"] = "rbxassetid://10709767656",
	["lucide-arrow-down-right"] = "rbxassetid://10709767750",
	["lucide-arrow-left"] = "rbxassetid://10709768114",
	["lucide-arrow-left-circle"] = "rbxassetid://10709767936",
	["lucide-arrow-left-right"] = "rbxassetid://10709768019",
	["lucide-arrow-right"] = "rbxassetid://10709768347",
	["lucide-arrow-right-circle"] = "rbxassetid://10709768226",
	["lucide-arrow-up"] = "rbxassetid://10709768939",
	["lucide-arrow-up-circle"] = "rbxassetid://10709768432",
	["lucide-arrow-up-down"] = "rbxassetid://10709768538",
	["lucide-arrow-up-left"] = "rbxassetid://10709768661",
	["lucide-arrow-up-right"] = "rbxassetid://10709768787",
	["lucide-asterisk"] = "rbxassetid://10709769095",
	["lucide-at-sign"] = "rbxassetid://10709769286",
	["lucide-award"] = "rbxassetid://10709769406",
	["lucide-axe"] = "rbxassetid://10709769508",
	["lucide-axis-3d"] = "rbxassetid://10709769598",
	["lucide-baby"] = "rbxassetid://10709769732",
	["lucide-backpack"] = "rbxassetid://10709769841",
	["lucide-baggage-claim"] = "rbxassetid://10709769935",
	["lucide-banana"] = "rbxassetid://10709770005",
	["lucide-banknote"] = "rbxassetid://10709770178",
	["lucide-bar-chart"] = "rbxassetid://10709773755",
	["lucide-bar-chart-2"] = "rbxassetid://10709770317",
	["lucide-bar-chart-3"] = "rbxassetid://10709770431",
	["lucide-bar-chart-4"] = "rbxassetid://10709770560",
	["lucide-bar-chart-horizontal"] = "rbxassetid://10709773669",
	["lucide-barcode"] = "rbxassetid://10747360675",
	["lucide-baseline"] = "rbxassetid://10709773863",
	["lucide-bath"] = "rbxassetid://10709773963",
	["lucide-battery"] = "rbxassetid://10709774640",
	["lucide-battery-charging"] = "rbxassetid://10709774068",
	["lucide-battery-full"] = "rbxassetid://10709774206",
	["lucide-battery-low"] = "rbxassetid://10709774370",
	["lucide-battery-medium"] = "rbxassetid://10709774513",
	["lucide-beaker"] = "rbxassetid://10709774756",
	["lucide-bed"] = "rbxassetid://10709775036",
	["lucide-bed-double"] = "rbxassetid://10709774864",
	["lucide-bed-single"] = "rbxassetid://10709774968",
	["lucide-beer"] = "rbxassetid://10709775167",
	["lucide-bell"] = "rbxassetid://10709775704",
	["lucide-bell-minus"] = "rbxassetid://10709775241",
	["lucide-bell-off"] = "rbxassetid://10709775320",
	["lucide-bell-plus"] = "rbxassetid://10709775448",
	["lucide-bell-ring"] = "rbxassetid://10709775560",
	["lucide-bike"] = "rbxassetid://10709775894",
	["lucide-binary"] = "rbxassetid://10709776050",
	["lucide-bitcoin"] = "rbxassetid://10709776126",
	["lucide-bluetooth"] = "rbxassetid://10709776655",
	["lucide-bluetooth-connected"] = "rbxassetid://10709776240",
	["lucide-bluetooth-off"] = "rbxassetid://10709776344",
	["lucide-bluetooth-searching"] = "rbxassetid://10709776501",
	["lucide-bold"] = "rbxassetid://10747813908",
	["lucide-bomb"] = "rbxassetid://10709781460",
	["lucide-bone"] = "rbxassetid://10709781605",
	["lucide-book"] = "rbxassetid://10709781824",
	["lucide-book-open"] = "rbxassetid://10709781717",
	["lucide-bookmark"] = "rbxassetid://10709782154",
	["lucide-bookmark-minus"] = "rbxassetid://10709781919",
	["lucide-bookmark-plus"] = "rbxassetid://10709782044",
	["lucide-bot"] = "rbxassetid://10709782230",
	["lucide-box"] = "rbxassetid://10709782497",
	["lucide-box-select"] = "rbxassetid://10709782342",
	["lucide-boxes"] = "rbxassetid://10709782582",
	["lucide-briefcase"] = "rbxassetid://10709782662",
	["lucide-brush"] = "rbxassetid://10709782758",
	["lucide-bug"] = "rbxassetid://10709782845",
	["lucide-building"] = "rbxassetid://10709783051",
	["lucide-building-2"] = "rbxassetid://10709782939",
	["lucide-bus"] = "rbxassetid://10709783137",
	["lucide-cake"] = "rbxassetid://10709783217",
	["lucide-calculator"] = "rbxassetid://10709783311",
	["lucide-calendar"] = "rbxassetid://10709789505",
	["lucide-calendar-check"] = "rbxassetid://10709783474",
	["lucide-calendar-check-2"] = "rbxassetid://10709783392",
	["lucide-calendar-clock"] = "rbxassetid://10709783577",
	["lucide-calendar-days"] = "rbxassetid://10709783673",
	["lucide-calendar-heart"] = "rbxassetid://10709783835",
	["lucide-calendar-minus"] = "rbxassetid://10709783959",
	["lucide-calendar-off"] = "rbxassetid://10709788784",
	["lucide-calendar-plus"] = "rbxassetid://10709788937",
	["lucide-calendar-range"] = "rbxassetid://10709789053",
	["lucide-calendar-search"] = "rbxassetid://10709789200",
	["lucide-calendar-x"] = "rbxassetid://10709789407",
	["lucide-calendar-x-2"] = "rbxassetid://10709789329",
	["lucide-camera"] = "rbxassetid://10709789686",
	["lucide-camera-off"] = "rbxassetid://10747822677",
	["lucide-car"] = "rbxassetid://10709789810",
	["lucide-carrot"] = "rbxassetid://10709789960",
	["lucide-cast"] = "rbxassetid://10709790097",
	["lucide-charge"] = "rbxassetid://10709790202",
	["lucide-check"] = "rbxassetid://10709790644",
	["lucide-check-circle"] = "rbxassetid://10709790387",
	["lucide-check-circle-2"] = "rbxassetid://10709790298",
	["lucide-check-square"] = "rbxassetid://10709790537",
	["lucide-chef-hat"] = "rbxassetid://10709790757",
	["lucide-cherry"] = "rbxassetid://10709790875",
	["lucide-chevron-down"] = "rbxassetid://10709790948",
	["lucide-chevron-first"] = "rbxassetid://10709791015",
	["lucide-chevron-last"] = "rbxassetid://10709791130",
	["lucide-chevron-left"] = "rbxassetid://10709791281",
	["lucide-chevron-right"] = "rbxassetid://10709791437",
	["lucide-chevron-up"] = "rbxassetid://10709791523",
	["lucide-chevrons-down"] = "rbxassetid://10709796864",
	["lucide-chevrons-down-up"] = "rbxassetid://10709791632",
	["lucide-chevrons-left"] = "rbxassetid://10709797151",
	["lucide-chevrons-left-right"] = "rbxassetid://10709797006",
	["lucide-chevrons-right"] = "rbxassetid://10709797382",
	["lucide-chevrons-right-left"] = "rbxassetid://10709797274",
	["lucide-chevrons-up"] = "rbxassetid://10709797622",
	["lucide-chevrons-up-down"] = "rbxassetid://10709797508",
	["lucide-chrome"] = "rbxassetid://10709797725",
	["lucide-circle"] = "rbxassetid://10709798174",
	["lucide-circle-dot"] = "rbxassetid://10709797837",
	["lucide-circle-ellipsis"] = "rbxassetid://10709797985",
	["lucide-circle-slashed"] = "rbxassetid://10709798100",
	["lucide-citrus"] = "rbxassetid://10709798276",
	["lucide-clapperboard"] = "rbxassetid://10709798350",
	["lucide-clipboard"] = "rbxassetid://10709799288",
	["lucide-clipboard-check"] = "rbxassetid://10709798443",
	["lucide-clipboard-copy"] = "rbxassetid://10709798574",
	["lucide-clipboard-edit"] = "rbxassetid://10709798682",
	["lucide-clipboard-list"] = "rbxassetid://10709798792",
	["lucide-clipboard-signature"] = "rbxassetid://10709798890",
	["lucide-clipboard-type"] = "rbxassetid://10709798999",
	["lucide-clipboard-x"] = "rbxassetid://10709799124",
	["lucide-clock"] = "rbxassetid://10709805144",
	["lucide-clock-1"] = "rbxassetid://10709799535",
	["lucide-clock-10"] = "rbxassetid://10709799718",
	["lucide-clock-11"] = "rbxassetid://10709799818",
	["lucide-clock-12"] = "rbxassetid://10709799962",
	["lucide-clock-2"] = "rbxassetid://10709803876",
	["lucide-clock-3"] = "rbxassetid://10709803989",
	["lucide-clock-4"] = "rbxassetid://10709804164",
	["lucide-clock-5"] = "rbxassetid://10709804291",
	["lucide-clock-6"] = "rbxassetid://10709804435",
	["lucide-clock-7"] = "rbxassetid://10709804599",
	["lucide-clock-8"] = "rbxassetid://10709804784",
	["lucide-clock-9"] = "rbxassetid://10709804996",
	["lucide-cloud"] = "rbxassetid://10709806740",
	["lucide-cloud-cog"] = "rbxassetid://10709805262",
	["lucide-cloud-drizzle"] = "rbxassetid://10709805371",
	["lucide-cloud-fog"] = "rbxassetid://10709805477",
	["lucide-cloud-hail"] = "rbxassetid://10709805596",
	["lucide-cloud-lightning"] = "rbxassetid://10709805727",
	["lucide-cloud-moon"] = "rbxassetid://10709805942",
	["lucide-cloud-moon-rain"] = "rbxassetid://10709805838",
	["lucide-cloud-off"] = "rbxassetid://10709806060",
	["lucide-cloud-rain"] = "rbxassetid://10709806277",
	["lucide-cloud-rain-wind"] = "rbxassetid://10709806166",
	["lucide-cloud-snow"] = "rbxassetid://10709806374",
	["lucide-cloud-sun"] = "rbxassetid://10709806631",
	["lucide-cloud-sun-rain"] = "rbxassetid://10709806475",
	["lucide-cloudy"] = "rbxassetid://10709806859",
	["lucide-clover"] = "rbxassetid://10709806995",
	["lucide-code"] = "rbxassetid://10709810463",
	["lucide-code-2"] = "rbxassetid://10709807111",
	["lucide-codepen"] = "rbxassetid://10709810534",
	["lucide-codesandbox"] = "rbxassetid://10709810676",
	["lucide-coffee"] = "rbxassetid://10709810814",
	["lucide-cog"] = "rbxassetid://10709810948",
	["lucide-coins"] = "rbxassetid://10709811110",
	["lucide-columns"] = "rbxassetid://10709811261",
	["lucide-command"] = "rbxassetid://10709811365",
	["lucide-compass"] = "rbxassetid://10709811445",
	["lucide-component"] = "rbxassetid://10709811595",
	["lucide-concierge-bell"] = "rbxassetid://10709811706",
	["lucide-connection"] = "rbxassetid://10747361219",
	["lucide-contact"] = "rbxassetid://10709811834",
	["lucide-contrast"] = "rbxassetid://10709811939",
	["lucide-cookie"] = "rbxassetid://10709812067",
	["lucide-copy"] = "rbxassetid://10709812159",
	["lucide-copyleft"] = "rbxassetid://10709812251",
	["lucide-copyright"] = "rbxassetid://10709812311",
	["lucide-corner-down-left"] = "rbxassetid://10709812396",
	["lucide-corner-down-right"] = "rbxassetid://10709812485",
	["lucide-corner-left-down"] = "rbxassetid://10709812632",
	["lucide-corner-left-up"] = "rbxassetid://10709812784",
	["lucide-corner-right-down"] = "rbxassetid://10709812939",
	["lucide-corner-right-up"] = "rbxassetid://10709813094",
	["lucide-corner-up-left"] = "rbxassetid://10709813185",
	["lucide-corner-up-right"] = "rbxassetid://10709813281",
	["lucide-cpu"] = "rbxassetid://10709813383",
	["lucide-croissant"] = "rbxassetid://10709818125",
	["lucide-crop"] = "rbxassetid://10709818245",
	["lucide-cross"] = "rbxassetid://10709818399",
	["lucide-crosshair"] = "rbxassetid://10709818534",
	["lucide-crown"] = "rbxassetid://10709818626",
	["lucide-cup-soda"] = "rbxassetid://10709818763",
	["lucide-curly-braces"] = "rbxassetid://10709818847",
	["lucide-currency"] = "rbxassetid://10709818931",
	["lucide-database"] = "rbxassetid://10709818996",
	["lucide-delete"] = "rbxassetid://10709819059",
	["lucide-diamond"] = "rbxassetid://10709819149",
	["lucide-dice-1"] = "rbxassetid://10709819266",
	["lucide-dice-2"] = "rbxassetid://10709819361",
	["lucide-dice-3"] = "rbxassetid://10709819508",
	["lucide-dice-4"] = "rbxassetid://10709819670",
	["lucide-dice-5"] = "rbxassetid://10709819801",
	["lucide-dice-6"] = "rbxassetid://10709819896",
	["lucide-dices"] = "rbxassetid://10723343321",
	["lucide-diff"] = "rbxassetid://10723343416",
	["lucide-disc"] = "rbxassetid://10723343537",
	["lucide-divide"] = "rbxassetid://10723343805",
	["lucide-divide-circle"] = "rbxassetid://10723343636",
	["lucide-divide-square"] = "rbxassetid://10723343737",
	["lucide-dollar-sign"] = "rbxassetid://10723343958",
	["lucide-download"] = "rbxassetid://10723344270",
	["lucide-download-cloud"] = "rbxassetid://10723344088",
	["lucide-droplet"] = "rbxassetid://10723344432",
	["lucide-droplets"] = "rbxassetid://10734883356",
	["lucide-drumstick"] = "rbxassetid://10723344737",
	["lucide-edit"] = "rbxassetid://10734883598",
	["lucide-edit-2"] = "rbxassetid://10723344885",
	["lucide-edit-3"] = "rbxassetid://10723345088",
	["lucide-egg"] = "rbxassetid://10723345518",
	["lucide-egg-fried"] = "rbxassetid://10723345347",
	["lucide-electricity"] = "rbxassetid://10723345749",
	["lucide-electricity-off"] = "rbxassetid://10723345643",
	["lucide-equal"] = "rbxassetid://10723345990",
	["lucide-equal-not"] = "rbxassetid://10723345866",
	["lucide-eraser"] = "rbxassetid://10723346158",
	["lucide-euro"] = "rbxassetid://10723346372",
	["lucide-expand"] = "rbxassetid://10723346553",
	["lucide-external-link"] = "rbxassetid://10723346684",
	["lucide-eye"] = "rbxassetid://10723346959",
	["lucide-eye-off"] = "rbxassetid://10723346871",
	["lucide-factory"] = "rbxassetid://10723347051",
	["lucide-fan"] = "rbxassetid://10723354359",
	["lucide-fast-forward"] = "rbxassetid://10723354521",
	["lucide-feather"] = "rbxassetid://10723354671",
	["lucide-figma"] = "rbxassetid://10723354801",
	["lucide-file"] = "rbxassetid://10723374641",
	["lucide-file-archive"] = "rbxassetid://10723354921",
	["lucide-file-audio"] = "rbxassetid://10723355148",
	["lucide-file-audio-2"] = "rbxassetid://10723355026",
	["lucide-file-axis-3d"] = "rbxassetid://10723355272",
	["lucide-file-badge"] = "rbxassetid://10723355622",
	["lucide-file-badge-2"] = "rbxassetid://10723355451",
	["lucide-file-bar-chart"] = "rbxassetid://10723355887",
	["lucide-file-bar-chart-2"] = "rbxassetid://10723355746",
	["lucide-file-box"] = "rbxassetid://10723355989",
	["lucide-file-check"] = "rbxassetid://10723356210",
	["lucide-file-check-2"] = "rbxassetid://10723356100",
	["lucide-file-clock"] = "rbxassetid://10723356329",
	["lucide-file-code"] = "rbxassetid://10723356507",
	["lucide-file-cog"] = "rbxassetid://10723356830",
	["lucide-file-cog-2"] = "rbxassetid://10723356676",
	["lucide-file-diff"] = "rbxassetid://10723357039",
	["lucide-file-digit"] = "rbxassetid://10723357151",
	["lucide-file-down"] = "rbxassetid://10723357322",
	["lucide-file-edit"] = "rbxassetid://10723357495",
	["lucide-file-heart"] = "rbxassetid://10723357637",
	["lucide-file-image"] = "rbxassetid://10723357790",
	["lucide-file-input"] = "rbxassetid://10723357933",
	["lucide-file-json"] = "rbxassetid://10723364435",
	["lucide-file-json-2"] = "rbxassetid://10723364361",
	["lucide-file-key"] = "rbxassetid://10723364605",
	["lucide-file-key-2"] = "rbxassetid://10723364515",
	["lucide-file-line-chart"] = "rbxassetid://10723364725",
	["lucide-file-lock"] = "rbxassetid://10723364957",
	["lucide-file-lock-2"] = "rbxassetid://10723364861",
	["lucide-file-minus"] = "rbxassetid://10723365254",
	["lucide-file-minus-2"] = "rbxassetid://10723365086",
	["lucide-file-output"] = "rbxassetid://10723365457",
	["lucide-file-pie-chart"] = "rbxassetid://10723365598",
	["lucide-file-plus"] = "rbxassetid://10723365877",
	["lucide-file-plus-2"] = "rbxassetid://10723365766",
	["lucide-file-question"] = "rbxassetid://10723365987",
	["lucide-file-scan"] = "rbxassetid://10723366167",
	["lucide-file-search"] = "rbxassetid://10723366550",
	["lucide-file-search-2"] = "rbxassetid://10723366340",
	["lucide-file-signature"] = "rbxassetid://10723366741",
	["lucide-file-spreadsheet"] = "rbxassetid://10723366962",
	["lucide-file-symlink"] = "rbxassetid://10723367098",
	["lucide-file-terminal"] = "rbxassetid://10723367244",
	["lucide-file-text"] = "rbxassetid://10723367380",
	["lucide-file-type"] = "rbxassetid://10723367606",
	["lucide-file-type-2"] = "rbxassetid://10723367509",
	["lucide-file-up"] = "rbxassetid://10723367734",
	["lucide-file-video"] = "rbxassetid://10723373884",
	["lucide-file-video-2"] = "rbxassetid://10723367834",
	["lucide-file-volume"] = "rbxassetid://10723374172",
	["lucide-file-volume-2"] = "rbxassetid://10723374030",
	["lucide-file-warning"] = "rbxassetid://10723374276",
	["lucide-file-x"] = "rbxassetid://10723374544",
	["lucide-file-x-2"] = "rbxassetid://10723374378",
	["lucide-files"] = "rbxassetid://10723374759",
	["lucide-film"] = "rbxassetid://10723374981",
	["lucide-filter"] = "rbxassetid://10723375128",
	["lucide-fingerprint"] = "rbxassetid://10723375250",
	["lucide-flag"] = "rbxassetid://10723375890",
	["lucide-flag-off"] = "rbxassetid://10723375443",
	["lucide-flag-triangle-left"] = "rbxassetid://10723375608",
	["lucide-flag-triangle-right"] = "rbxassetid://10723375727",
	["lucide-flame"] = "rbxassetid://10723376114",
	["lucide-flashlight"] = "rbxassetid://10723376471",
	["lucide-flashlight-off"] = "rbxassetid://10723376365",
	["lucide-flask-conical"] = "rbxassetid://10734883986",
	["lucide-flask-round"] = "rbxassetid://10723376614",
	["lucide-flip-horizontal"] = "rbxassetid://10723376884",
	["lucide-flip-horizontal-2"] = "rbxassetid://10723376745",
	["lucide-flip-vertical"] = "rbxassetid://10723377138",
	["lucide-flip-vertical-2"] = "rbxassetid://10723377026",
	["lucide-flower"] = "rbxassetid://10747830374",
	["lucide-flower-2"] = "rbxassetid://10723377305",
	["lucide-focus"] = "rbxassetid://10723377537",
	["lucide-folder"] = "rbxassetid://10723387563",
	["lucide-folder-archive"] = "rbxassetid://10723384478",
	["lucide-folder-check"] = "rbxassetid://10723384605",
	["lucide-folder-clock"] = "rbxassetid://10723384731",
	["lucide-folder-closed"] = "rbxassetid://10723384893",
	["lucide-folder-cog"] = "rbxassetid://10723385213",
	["lucide-folder-cog-2"] = "rbxassetid://10723385036",
	["lucide-folder-down"] = "rbxassetid://10723385338",
	["lucide-folder-edit"] = "rbxassetid://10723385445",
	["lucide-folder-heart"] = "rbxassetid://10723385545",
	["lucide-folder-input"] = "rbxassetid://10723385721",
	["lucide-folder-key"] = "rbxassetid://10723385848",
	["lucide-folder-lock"] = "rbxassetid://10723386005",
	["lucide-folder-minus"] = "rbxassetid://10723386127",
	["lucide-folder-open"] = "rbxassetid://10723386277",
	["lucide-folder-output"] = "rbxassetid://10723386386",
	["lucide-folder-plus"] = "rbxassetid://10723386531",
	["lucide-folder-search"] = "rbxassetid://10723386787",
	["lucide-folder-search-2"] = "rbxassetid://10723386674",
	["lucide-folder-symlink"] = "rbxassetid://10723386930",
	["lucide-folder-tree"] = "rbxassetid://10723387085",
	["lucide-folder-up"] = "rbxassetid://10723387265",
	["lucide-folder-x"] = "rbxassetid://10723387448",
	["lucide-folders"] = "rbxassetid://10723387721",
	["lucide-form-input"] = "rbxassetid://10723387841",
	["lucide-forward"] = "rbxassetid://10723388016",
	["lucide-frame"] = "rbxassetid://10723394389",
	["lucide-framer"] = "rbxassetid://10723394565",
	["lucide-frown"] = "rbxassetid://10723394681",
	["lucide-fuel"] = "rbxassetid://10723394846",
	["lucide-function-square"] = "rbxassetid://10723395041",
	["lucide-gamepad"] = "rbxassetid://10723395457",
	["lucide-gamepad-2"] = "rbxassetid://10723395215",
	["lucide-gauge"] = "rbxassetid://10723395708",
	["lucide-gavel"] = "rbxassetid://10723395896",
	["lucide-gem"] = "rbxassetid://10723396000",
	["lucide-ghost"] = "rbxassetid://10723396107",
	["lucide-gift"] = "rbxassetid://10723396402",
	["lucide-gift-card"] = "rbxassetid://10723396225",
	["lucide-git-branch"] = "rbxassetid://10723396676",
	["lucide-git-branch-plus"] = "rbxassetid://10723396542",
	["lucide-git-commit"] = "rbxassetid://10723396812",
	["lucide-git-compare"] = "rbxassetid://10723396954",
	["lucide-git-fork"] = "rbxassetid://10723397049",
	["lucide-git-merge"] = "rbxassetid://10723397165",
	["lucide-git-pull-request"] = "rbxassetid://10723397431",
	["lucide-git-pull-request-closed"] = "rbxassetid://10723397268",
	["lucide-git-pull-request-draft"] = "rbxassetid://10734884302",
	["lucide-glass"] = "rbxassetid://10723397788",
	["lucide-glass-2"] = "rbxassetid://10723397529",
	["lucide-glass-water"] = "rbxassetid://10723397678",
	["lucide-glasses"] = "rbxassetid://10723397895",
	["lucide-globe"] = "rbxassetid://10723404337",
	["lucide-globe-2"] = "rbxassetid://10723398002",
	["lucide-grab"] = "rbxassetid://10723404472",
	["lucide-graduation-cap"] = "rbxassetid://10723404691",
	["lucide-grape"] = "rbxassetid://10723404822",
	["lucide-grid"] = "rbxassetid://10723404936",
	["lucide-grip-horizontal"] = "rbxassetid://10723405089",
	["lucide-grip-vertical"] = "rbxassetid://10723405236",
	["lucide-hammer"] = "rbxassetid://10723405360",
	["lucide-hand"] = "rbxassetid://10723405649",
	["lucide-hand-metal"] = "rbxassetid://10723405508",
	["lucide-hard-drive"] = "rbxassetid://10723405749",
	["lucide-hard-hat"] = "rbxassetid://10723405859",
	["lucide-hash"] = "rbxassetid://10723405975",
	["lucide-haze"] = "rbxassetid://10723406078",
	["lucide-headphones"] = "rbxassetid://10723406165",
	["lucide-heart"] = "rbxassetid://10723406885",
	["lucide-heart-crack"] = "rbxassetid://10723406299",
	["lucide-heart-handshake"] = "rbxassetid://10723406480",
	["lucide-heart-off"] = "rbxassetid://10723406662",
	["lucide-heart-pulse"] = "rbxassetid://10723406795",
	["lucide-help-circle"] = "rbxassetid://10723406988",
	["lucide-hexagon"] = "rbxassetid://10723407092",
	["lucide-highlighter"] = "rbxassetid://10723407192",
	["lucide-history"] = "rbxassetid://10723407335",
	["lucide-home"] = "rbxassetid://10723407389",
	["lucide-hourglass"] = "rbxassetid://10723407498",
	["lucide-ice-cream"] = "rbxassetid://10723414308",
	["lucide-image"] = "rbxassetid://10723415040",
	["lucide-image-minus"] = "rbxassetid://10723414487",
	["lucide-image-off"] = "rbxassetid://10723414677",
	["lucide-image-plus"] = "rbxassetid://10723414827",
	["lucide-import"] = "rbxassetid://10723415205",
	["lucide-inbox"] = "rbxassetid://10723415335",
	["lucide-indent"] = "rbxassetid://10723415494",
	["lucide-indian-rupee"] = "rbxassetid://10723415642",
	["lucide-infinity"] = "rbxassetid://10723415766",
	["lucide-info"] = "rbxassetid://10723415903",
	["lucide-inspect"] = "rbxassetid://10723416057",
	["lucide-italic"] = "rbxassetid://10723416195",
	["lucide-japanese-yen"] = "rbxassetid://10723416363",
	["lucide-joystick"] = "rbxassetid://10723416527",
	["lucide-key"] = "rbxassetid://10723416652",
	["lucide-keyboard"] = "rbxassetid://10723416765",
	["lucide-lamp"] = "rbxassetid://10723417513",
	["lucide-lamp-ceiling"] = "rbxassetid://10723416922",
	["lucide-lamp-desk"] = "rbxassetid://10723417016",
	["lucide-lamp-floor"] = "rbxassetid://10723417131",
	["lucide-lamp-wall-down"] = "rbxassetid://10723417240",
	["lucide-lamp-wall-up"] = "rbxassetid://10723417356",
	["lucide-landmark"] = "rbxassetid://10723417608",
	["lucide-languages"] = "rbxassetid://10723417703",
	["lucide-laptop"] = "rbxassetid://10723423881",
	["lucide-laptop-2"] = "rbxassetid://10723417797",
	["lucide-lasso"] = "rbxassetid://10723424235",
	["lucide-lasso-select"] = "rbxassetid://10723424058",
	["lucide-laugh"] = "rbxassetid://10723424372",
	["lucide-layers"] = "rbxassetid://10723424505",
	["lucide-layout"] = "rbxassetid://10723425376",
	["lucide-layout-dashboard"] = "rbxassetid://10723424646",
	["lucide-layout-grid"] = "rbxassetid://10723424838",
	["lucide-layout-list"] = "rbxassetid://10723424963",
	["lucide-layout-template"] = "rbxassetid://10723425187",
	["lucide-leaf"] = "rbxassetid://10723425539",
	["lucide-library"] = "rbxassetid://10723425615",
	["lucide-life-buoy"] = "rbxassetid://10723425685",
	["lucide-lightbulb"] = "rbxassetid://10723425852",
	["lucide-lightbulb-off"] = "rbxassetid://10723425762",
	["lucide-line-chart"] = "rbxassetid://10723426393",
	["lucide-link"] = "rbxassetid://10723426722",
	["lucide-link-2"] = "rbxassetid://10723426595",
	["lucide-link-2-off"] = "rbxassetid://10723426513",
	["lucide-list"] = "rbxassetid://10723433811",
	["lucide-list-checks"] = "rbxassetid://10734884548",
	["lucide-list-end"] = "rbxassetid://10723426886",
	["lucide-list-minus"] = "rbxassetid://10723426986",
	["lucide-list-music"] = "rbxassetid://10723427081",
	["lucide-list-ordered"] = "rbxassetid://10723427199",
	["lucide-list-plus"] = "rbxassetid://10723427334",
	["lucide-list-start"] = "rbxassetid://10723427494",
	["lucide-list-video"] = "rbxassetid://10723427619",
	["lucide-list-x"] = "rbxassetid://10723433655",
	["lucide-loader"] = "rbxassetid://10723434070",
	["lucide-loader-2"] = "rbxassetid://10723433935",
	["lucide-locate"] = "rbxassetid://10723434557",
	["lucide-locate-fixed"] = "rbxassetid://10723434236",
	["lucide-locate-off"] = "rbxassetid://10723434379",
	["lucide-lock"] = "rbxassetid://10723434711",
	["lucide-log-in"] = "rbxassetid://10723434830",
	["lucide-log-out"] = "rbxassetid://10723434906",
	["lucide-luggage"] = "rbxassetid://10723434993",
	["lucide-magnet"] = "rbxassetid://10723435069",
	["lucide-mail"] = "rbxassetid://10734885430",
	["lucide-mail-check"] = "rbxassetid://10723435182",
	["lucide-mail-minus"] = "rbxassetid://10723435261",
	["lucide-mail-open"] = "rbxassetid://10723435342",
	["lucide-mail-plus"] = "rbxassetid://10723435443",
	["lucide-mail-question"] = "rbxassetid://10723435515",
	["lucide-mail-search"] = "rbxassetid://10734884739",
	["lucide-mail-warning"] = "rbxassetid://10734885015",
	["lucide-mail-x"] = "rbxassetid://10734885247",
	["lucide-mails"] = "rbxassetid://10734885614",
	["lucide-map"] = "rbxassetid://10734886202",
	["lucide-map-pin"] = "rbxassetid://10734886004",
	["lucide-map-pin-off"] = "rbxassetid://10734885803",
	["lucide-maximize"] = "rbxassetid://10734886735",
	["lucide-maximize-2"] = "rbxassetid://10734886496",
	["lucide-medal"] = "rbxassetid://10734887072",
	["lucide-megaphone"] = "rbxassetid://10734887454",
	["lucide-megaphone-off"] = "rbxassetid://10734887311",
	["lucide-meh"] = "rbxassetid://10734887603",
	["lucide-menu"] = "rbxassetid://10734887784",
	["lucide-message-circle"] = "rbxassetid://10734888000",
	["lucide-message-square"] = "rbxassetid://10734888228",
	["lucide-mic"] = "rbxassetid://10734888864",
	["lucide-mic-2"] = "rbxassetid://10734888430",
	["lucide-mic-off"] = "rbxassetid://10734888646",
	["lucide-microscope"] = "rbxassetid://10734889106",
	["lucide-microwave"] = "rbxassetid://10734895076",
	["lucide-milestone"] = "rbxassetid://10734895310",
	["lucide-minimize"] = "rbxassetid://10734895698",
	["lucide-minimize-2"] = "rbxassetid://10734895530",
	["lucide-minus"] = "rbxassetid://10734896206",
	["lucide-minus-circle"] = "rbxassetid://10734895856",
	["lucide-minus-square"] = "rbxassetid://10734896029",
	["lucide-monitor"] = "rbxassetid://10734896881",
	["lucide-monitor-off"] = "rbxassetid://10734896360",
	["lucide-monitor-speaker"] = "rbxassetid://10734896512",
	["lucide-moon"] = "rbxassetid://10734897102",
	["lucide-more-horizontal"] = "rbxassetid://10734897250",
	["lucide-more-vertical"] = "rbxassetid://10734897387",
	["lucide-mountain"] = "rbxassetid://10734897956",
	["lucide-mountain-snow"] = "rbxassetid://10734897665",
	["lucide-mouse"] = "rbxassetid://10734898592",
	["lucide-mouse-pointer"] = "rbxassetid://10734898476",
	["lucide-mouse-pointer-2"] = "rbxassetid://10734898194",
	["lucide-mouse-pointer-click"] = "rbxassetid://10734898355",
	["lucide-move"] = "rbxassetid://10734900011",
	["lucide-move-3d"] = "rbxassetid://10734898756",
	["lucide-move-diagonal"] = "rbxassetid://10734899164",
	["lucide-move-diagonal-2"] = "rbxassetid://10734898934",
	["lucide-move-horizontal"] = "rbxassetid://10734899414",
	["lucide-move-vertical"] = "rbxassetid://10734899821",
	["lucide-music"] = "rbxassetid://10734905958",
	["lucide-music-2"] = "rbxassetid://10734900215",
	["lucide-music-3"] = "rbxassetid://10734905665",
	["lucide-music-4"] = "rbxassetid://10734905823",
	["lucide-navigation"] = "rbxassetid://10734906744",
	["lucide-navigation-2"] = "rbxassetid://10734906332",
	["lucide-navigation-2-off"] = "rbxassetid://10734906144",
	["lucide-navigation-off"] = "rbxassetid://10734906580",
	["lucide-network"] = "rbxassetid://10734906975",
	["lucide-newspaper"] = "rbxassetid://10734907168",
	["lucide-octagon"] = "rbxassetid://10734907361",
	["lucide-option"] = "rbxassetid://10734907649",
	["lucide-outdent"] = "rbxassetid://10734907933",
	["lucide-package"] = "rbxassetid://10734909540",
	["lucide-package-2"] = "rbxassetid://10734908151",
	["lucide-package-check"] = "rbxassetid://10734908384",
	["lucide-package-minus"] = "rbxassetid://10734908626",
	["lucide-package-open"] = "rbxassetid://10734908793",
	["lucide-package-plus"] = "rbxassetid://10734909016",
	["lucide-package-search"] = "rbxassetid://10734909196",
	["lucide-package-x"] = "rbxassetid://10734909375",
	["lucide-paint-bucket"] = "rbxassetid://10734909847",
	["lucide-paintbrush"] = "rbxassetid://10734910187",
	["lucide-paintbrush-2"] = "rbxassetid://10734910030",
	["lucide-palette"] = "rbxassetid://10734910430",
	["lucide-palmtree"] = "rbxassetid://10734910680",
	["lucide-paperclip"] = "rbxassetid://10734910927",
	["lucide-party-popper"] = "rbxassetid://10734918735",
	["lucide-pause"] = "rbxassetid://10734919336",
	["lucide-pause-circle"] = "rbxassetid://10735024209",
	["lucide-pause-octagon"] = "rbxassetid://10734919143",
	["lucide-pen-tool"] = "rbxassetid://10734919503",
	["lucide-pencil"] = "rbxassetid://10734919691",
	["lucide-percent"] = "rbxassetid://10734919919",
	["lucide-person-standing"] = "rbxassetid://10734920149",
	["lucide-phone"] = "rbxassetid://10734921524",
	["lucide-phone-call"] = "rbxassetid://10734920305",
	["lucide-phone-forwarded"] = "rbxassetid://10734920508",
	["lucide-phone-incoming"] = "rbxassetid://10734920694",
	["lucide-phone-missed"] = "rbxassetid://10734920845",
	["lucide-phone-off"] = "rbxassetid://10734921077",
	["lucide-phone-outgoing"] = "rbxassetid://10734921288",
	["lucide-pie-chart"] = "rbxassetid://10734921727",
	["lucide-piggy-bank"] = "rbxassetid://10734921935",
	["lucide-pin"] = "rbxassetid://10734922324",
	["lucide-pin-off"] = "rbxassetid://10734922180",
	["lucide-pipette"] = "rbxassetid://10734922497",
	["lucide-pizza"] = "rbxassetid://10734922774",
	["lucide-plane"] = "rbxassetid://10734922971",
	["lucide-play"] = "rbxassetid://10734923549",
	["lucide-play-circle"] = "rbxassetid://10734923214",
	["lucide-plus"] = "rbxassetid://10734924532",
	["lucide-plus-circle"] = "rbxassetid://10734923868",
	["lucide-plus-square"] = "rbxassetid://10734924219",
	["lucide-podcast"] = "rbxassetid://10734929553",
	["lucide-pointer"] = "rbxassetid://10734929723",
	["lucide-pound-sterling"] = "rbxassetid://10734929981",
	["lucide-power"] = "rbxassetid://10734930466",
	["lucide-power-off"] = "rbxassetid://10734930257",
	["lucide-printer"] = "rbxassetid://10734930632",
	["lucide-puzzle"] = "rbxassetid://10734930886",
	["lucide-quote"] = "rbxassetid://10734931234",
	["lucide-radio"] = "rbxassetid://10734931596",
	["lucide-radio-receiver"] = "rbxassetid://10734931402",
	["lucide-rectangle-horizontal"] = "rbxassetid://10734931777",
	["lucide-rectangle-vertical"] = "rbxassetid://10734932081",
	["lucide-recycle"] = "rbxassetid://10734932295",
	["lucide-redo"] = "rbxassetid://10734932822",
	["lucide-redo-2"] = "rbxassetid://10734932586",
	["lucide-refresh-ccw"] = "rbxassetid://10734933056",
	["lucide-refresh-cw"] = "rbxassetid://10734933222",
	["lucide-refrigerator"] = "rbxassetid://10734933465",
	["lucide-regex"] = "rbxassetid://10734933655",
	["lucide-repeat"] = "rbxassetid://10734933966",
	["lucide-repeat-1"] = "rbxassetid://10734933826",
	["lucide-reply"] = "rbxassetid://10734934252",
	["lucide-reply-all"] = "rbxassetid://10734934132",
	["lucide-rewind"] = "rbxassetid://10734934347",
	["lucide-rocket"] = "rbxassetid://10734934585",
	["lucide-rocking-chair"] = "rbxassetid://10734939942",
	["lucide-rotate-3d"] = "rbxassetid://10734940107",
	["lucide-rotate-ccw"] = "rbxassetid://10734940376",
	["lucide-rotate-cw"] = "rbxassetid://10734940654",
	["lucide-rss"] = "rbxassetid://10734940825",
	["lucide-ruler"] = "rbxassetid://10734941018",
	["lucide-russian-ruble"] = "rbxassetid://10734941199",
	["lucide-sailboat"] = "rbxassetid://10734941354",
	["lucide-save"] = "rbxassetid://10734941499",
	["lucide-scale"] = "rbxassetid://10734941912",
	["lucide-scale-3d"] = "rbxassetid://10734941739",
	["lucide-scaling"] = "rbxassetid://10734942072",
	["lucide-scan"] = "rbxassetid://10734942565",
	["lucide-scan-face"] = "rbxassetid://10734942198",
	["lucide-scan-line"] = "rbxassetid://10734942351",
	["lucide-scissors"] = "rbxassetid://10734942778",
	["lucide-screen-share"] = "rbxassetid://10734943193",
	["lucide-screen-share-off"] = "rbxassetid://10734942967",
	["lucide-scroll"] = "rbxassetid://10734943448",
	["lucide-search"] = "rbxassetid://10734943674",
	["lucide-send"] = "rbxassetid://10734943902",
	["lucide-separator-horizontal"] = "rbxassetid://10734944115",
	["lucide-separator-vertical"] = "rbxassetid://10734944326",
	["lucide-server"] = "rbxassetid://10734949856",
	["lucide-server-cog"] = "rbxassetid://10734944444",
	["lucide-server-crash"] = "rbxassetid://10734944554",
	["lucide-server-off"] = "rbxassetid://10734944668",
	["lucide-settings"] = "rbxassetid://10734950309",
	["lucide-settings-2"] = "rbxassetid://10734950020",
	["lucide-share"] = "rbxassetid://10734950813",
	["lucide-share-2"] = "rbxassetid://10734950553",
	["lucide-sheet"] = "rbxassetid://10734951038",
	["lucide-shield"] = "rbxassetid://10734951847",
	["lucide-shield-alert"] = "rbxassetid://10734951173",
	["lucide-shield-check"] = "rbxassetid://10734951367",
	["lucide-shield-close"] = "rbxassetid://10734951535",
	["lucide-shield-off"] = "rbxassetid://10734951684",
	["lucide-shirt"] = "rbxassetid://10734952036",
	["lucide-shopping-bag"] = "rbxassetid://10734952273",
	["lucide-shopping-cart"] = "rbxassetid://10734952479",
	["lucide-shovel"] = "rbxassetid://10734952773",
	["lucide-shower-head"] = "rbxassetid://10734952942",
	["lucide-shrink"] = "rbxassetid://10734953073",
	["lucide-shrub"] = "rbxassetid://10734953241",
	["lucide-shuffle"] = "rbxassetid://10734953451",
	["lucide-sidebar"] = "rbxassetid://10734954301",
	["lucide-sidebar-close"] = "rbxassetid://10734953715",
	["lucide-sidebar-open"] = "rbxassetid://10734954000",
	["lucide-sigma"] = "rbxassetid://10734954538",
	["lucide-signal"] = "rbxassetid://10734961133",
	["lucide-signal-high"] = "rbxassetid://10734954807",
	["lucide-signal-low"] = "rbxassetid://10734955080",
	["lucide-signal-medium"] = "rbxassetid://10734955336",
	["lucide-signal-zero"] = "rbxassetid://10734960878",
	["lucide-siren"] = "rbxassetid://10734961284",
	["lucide-skip-back"] = "rbxassetid://10734961526",
	["lucide-skip-forward"] = "rbxassetid://10734961809",
	["lucide-skull"] = "rbxassetid://10734962068",
	["lucide-slack"] = "rbxassetid://10734962339",
	["lucide-slash"] = "rbxassetid://10734962600",
	["lucide-slice"] = "rbxassetid://10734963024",
	["lucide-sliders"] = "rbxassetid://10734963400",
	["lucide-sliders-horizontal"] = "rbxassetid://10734963191",
	["lucide-smartphone"] = "rbxassetid://10734963940",
	["lucide-smartphone-charging"] = "rbxassetid://10734963671",
	["lucide-smile"] = "rbxassetid://10734964441",
	["lucide-smile-plus"] = "rbxassetid://10734964188",
	["lucide-snowflake"] = "rbxassetid://10734964600",
	["lucide-sofa"] = "rbxassetid://10734964852",
	["lucide-sort-asc"] = "rbxassetid://10734965115",
	["lucide-sort-desc"] = "rbxassetid://10734965287",
	["lucide-speaker"] = "rbxassetid://10734965419",
	["lucide-sprout"] = "rbxassetid://10734965572",
	["lucide-square"] = "rbxassetid://10734965702",
	["lucide-star"] = "rbxassetid://10734966248",
	["lucide-star-half"] = "rbxassetid://10734965897",
	["lucide-star-off"] = "rbxassetid://10734966097",
	["lucide-stethoscope"] = "rbxassetid://10734966384",
	["lucide-sticker"] = "rbxassetid://10734972234",
	["lucide-sticky-note"] = "rbxassetid://10734972463",
	["lucide-stop-circle"] = "rbxassetid://10734972621",
	["lucide-stretch-horizontal"] = "rbxassetid://10734972862",
	["lucide-stretch-vertical"] = "rbxassetid://10734973130",
	["lucide-strikethrough"] = "rbxassetid://10734973290",
	["lucide-subscript"] = "rbxassetid://10734973457",
	["lucide-sun"] = "rbxassetid://10734974297",
	["lucide-sun-dim"] = "rbxassetid://10734973645",
	["lucide-sun-medium"] = "rbxassetid://10734973778",
	["lucide-sun-moon"] = "rbxassetid://10734973999",
	["lucide-sun-snow"] = "rbxassetid://10734974130",
	["lucide-sunrise"] = "rbxassetid://10734974522",
	["lucide-sunset"] = "rbxassetid://10734974689",
	["lucide-superscript"] = "rbxassetid://10734974850",
	["lucide-swiss-franc"] = "rbxassetid://10734975024",
	["lucide-switch-camera"] = "rbxassetid://10734975214",
	["lucide-sword"] = "rbxassetid://10734975486",
	["lucide-swords"] = "rbxassetid://10734975692",
	["lucide-syringe"] = "rbxassetid://10734975932",
	["lucide-table"] = "rbxassetid://10734976230",
	["lucide-table-2"] = "rbxassetid://10734976097",
	["lucide-tablet"] = "rbxassetid://10734976394",
	["lucide-tag"] = "rbxassetid://10734976528",
	["lucide-tags"] = "rbxassetid://10734976739",
	["lucide-target"] = "rbxassetid://10734977012",
	["lucide-tent"] = "rbxassetid://10734981750",
	["lucide-terminal"] = "rbxassetid://10734982144",
	["lucide-terminal-square"] = "rbxassetid://10734981995",
	["lucide-text-cursor"] = "rbxassetid://10734982395",
	["lucide-text-cursor-input"] = "rbxassetid://10734982297",
	["lucide-thermometer"] = "rbxassetid://10734983134",
	["lucide-thermometer-snowflake"] = "rbxassetid://10734982571",
	["lucide-thermometer-sun"] = "rbxassetid://10734982771",
	["lucide-thumbs-down"] = "rbxassetid://10734983359",
	["lucide-thumbs-up"] = "rbxassetid://10734983629",
	["lucide-ticket"] = "rbxassetid://10734983868",
	["lucide-timer"] = "rbxassetid://10734984606",
	["lucide-timer-off"] = "rbxassetid://10734984138",
	["lucide-timer-reset"] = "rbxassetid://10734984355",
	["lucide-toggle-left"] = "rbxassetid://10734984834",
	["lucide-toggle-right"] = "rbxassetid://10734985040",
	["lucide-tornado"] = "rbxassetid://10734985247",
	["lucide-toy-brick"] = "rbxassetid://10747361919",
	["lucide-train"] = "rbxassetid://10747362105",
	["lucide-trash"] = "rbxassetid://10747362393",
	["lucide-trash-2"] = "rbxassetid://10747362241",
	["lucide-tree-deciduous"] = "rbxassetid://10747362534",
	["lucide-tree-pine"] = "rbxassetid://10747362748",
	["lucide-trees"] = "rbxassetid://10747363016",
	["lucide-trending-down"] = "rbxassetid://10747363205",
	["lucide-trending-up"] = "rbxassetid://10747363465",
	["lucide-triangle"] = "rbxassetid://10747363621",
	["lucide-trophy"] = "rbxassetid://10747363809",
	["lucide-truck"] = "rbxassetid://10747364031",
	["lucide-tv"] = "rbxassetid://10747364593",
	["lucide-tv-2"] = "rbxassetid://10747364302",
	["lucide-type"] = "rbxassetid://10747364761",
	["lucide-umbrella"] = "rbxassetid://10747364971",
	["lucide-underline"] = "rbxassetid://10747365191",
	["lucide-undo"] = "rbxassetid://10747365484",
	["lucide-undo-2"] = "rbxassetid://10747365359",
	["lucide-unlink"] = "rbxassetid://10747365771",
	["lucide-unlink-2"] = "rbxassetid://10747397871",
	["lucide-unlock"] = "rbxassetid://10747366027",
	["lucide-upload"] = "rbxassetid://10747366434",
	["lucide-upload-cloud"] = "rbxassetid://10747366266",
	["lucide-usb"] = "rbxassetid://10747366606",
	["lucide-user"] = "rbxassetid://10747373176",
	["lucide-user-check"] = "rbxassetid://10747371901",
	["lucide-user-cog"] = "rbxassetid://10747372167",
	["lucide-user-minus"] = "rbxassetid://10747372346",
	["lucide-user-plus"] = "rbxassetid://10747372702",
	["lucide-user-x"] = "rbxassetid://10747372992",
	["lucide-users"] = "rbxassetid://10747373426",
	["lucide-utensils"] = "rbxassetid://10747373821",
	["lucide-utensils-crossed"] = "rbxassetid://10747373629",
	["lucide-venetian-mask"] = "rbxassetid://10747374003",
	["lucide-verified"] = "rbxassetid://10747374131",
	["lucide-vibrate"] = "rbxassetid://10747374489",
	["lucide-vibrate-off"] = "rbxassetid://10747374269",
	["lucide-video"] = "rbxassetid://10747374938",
	["lucide-video-off"] = "rbxassetid://10747374721",
	["lucide-view"] = "rbxassetid://10747375132",
	["lucide-voicemail"] = "rbxassetid://10747375281",
	["lucide-volume"] = "rbxassetid://10747376008",
	["lucide-volume-1"] = "rbxassetid://10747375450",
	["lucide-volume-2"] = "rbxassetid://10747375679",
	["lucide-volume-x"] = "rbxassetid://10747375880",
	["lucide-wallet"] = "rbxassetid://10747376205",
	["lucide-wand"] = "rbxassetid://10747376565",
	["lucide-wand-2"] = "rbxassetid://10747376349",
	["lucide-watch"] = "rbxassetid://10747376722",
	["lucide-waves"] = "rbxassetid://10747376931",
	["lucide-webcam"] = "rbxassetid://10747381992",
	["lucide-wifi"] = "rbxassetid://10747382504",
	["lucide-wifi-off"] = "rbxassetid://10747382268",
	["lucide-wind"] = "rbxassetid://10747382750",
	["lucide-wrap-text"] = "rbxassetid://10747383065",
	["lucide-wrench"] = "rbxassetid://10747383470",
	["lucide-x"] = "rbxassetid://10747384394",
	["lucide-x-circle"] = "rbxassetid://10747383819",
	["lucide-x-octagon"] = "rbxassetid://10747384037",
	["lucide-x-square"] = "rbxassetid://10747384217",
	["lucide-zoom-in"] = "rbxassetid://10747384552",
	["lucide-zoom-out"] = "rbxassetid://10747384679",
}

local ts = game:GetService("TweenService")
local run = game:GetService("RunService")
local uis = game:GetService("UserInputService")
local players = game:GetService("Players")

local Ventures = Instance.new("ScreenGui")
Ventures.Name = "Ventures"
Ventures.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Ventures.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

function lib:Notify(tablen)
	local Notification = Instance.new("Frame")
	local UIGradient = Instance.new("UIGradient")
	local background = Instance.new("ImageLabel")
	local Tittle = Instance.new("TextLabel")
	local Content = Instance.new("TextLabel")
	local closebttn = Instance.new("TextButton")
	local UICorner = Instance.new("UICorner")
	local UICorner_2 = Instance.new("UICorner")
	local str4 = Instance.new("UIStroke")
	local str5  = Instance.new("UIStroke")

	local function getoffset()
		local offset = 0
		for _, v in ipairs(Ventures:GetChildren()) do
			if v:IsA("Frame") and v.Name == "Notification" then
				offset = offset + 0.13
			end
		end
		return offset
	end

	local offset = getoffset()

	Notification.Name = "Notification"
	Notification.Parent = Ventures
	Notification.BackgroundColor3 = Color3.fromRGB(31, 23, 34)
	Notification.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Notification.BackgroundTransparency = 0.15
	Notification.BorderSizePixel = 0
	Notification.Position = UDim2.new(1.3, 0, 0.764779866 - offset, 0)
	Notification.Size = UDim2.new(0, 301, 0, 89)
	Notification.Visible = true

	str5.Parent = Notification
	str5.Color = Color3.fromRGB(91, 67, 100)
	str5.Thickness = 1.3
	str5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

	UIGradient.Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0.00, Color3.fromRGB(72, 72, 72)), 
		ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))
	}
	UIGradient.Rotation = -90
	UIGradient.Parent = Notification

	background.Name = "background"
	background.Parent = Notification
	background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	background.BackgroundTransparency = 1.000
	background.BorderColor3 = Color3.fromRGB(0, 0, 0)
	background.BorderSizePixel = 0
	background.Size = UDim2.new(1, 0, 1, 0)
	background.Image = "rbxassetid://138515717272375"
	background.ImageTransparency = 0.660

	Tittle.Name = "Tittle"
	Tittle.Parent = Notification
	Tittle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Tittle.BackgroundTransparency = 1.000
	Tittle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Tittle.BorderSizePixel = 0
	Tittle.Position = UDim2.new(0.017698979, 0, 0.0384617485, 0)
	Tittle.Size = UDim2.new(0, 199, 0, 14)
	Tittle.Font = Enum.Font.FredokaOne
	Tittle.Text = tablen.Title or "Notification"
	Tittle.TextColor3 = Color3.fromRGB(194, 131, 183)
	Tittle.TextSize = 14.000
	Tittle.TextXAlignment = Enum.TextXAlignment.Left
	Tittle.TextYAlignment = Enum.TextYAlignment.Bottom

	Content.Name = "Content"
	Content.Parent = Notification
	Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Content.BackgroundTransparency = 1.000
	Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Content.BorderSizePixel = 0
	Content.Position = UDim2.new(0.040954791, 0, 0.350898653, 0)
	Content.Size = UDim2.new(0, 242, 0, 57)
	Content.Font = Enum.Font.FredokaOne
	Content.Text = tablen.Content or "Default content"
	Content.TextColor3 = Color3.fromRGB(94, 63, 89)
	Content.TextSize = 14.000
	Content.TextWrapped = true
	Content.TextXAlignment = Enum.TextXAlignment.Left
	Content.TextYAlignment = Enum.TextYAlignment.Top

	closebttn.Name = "closebttn"
	closebttn.Parent = Notification
	closebttn.BackgroundColor3 = Color3.fromRGB(39, 29, 43)
	closebttn.BorderColor3 = Color3.fromRGB(0, 0, 0)
	closebttn.BorderSizePixel = 0
	closebttn.AutoButtonColor = false
	closebttn.Position = UDim2.new(0.894999981, 0, 0.0700000003, 0)
	closebttn.Size = UDim2.new(0, 25, 0, 25)
	closebttn.Font = Enum.Font.FredokaOne
	closebttn.Text = "X"
	closebttn.TextColor3 = Color3.fromRGB(235, 159, 221)
	closebttn.TextSize = 14.000

	str4.Parent = closebttn
	str4.Color = Color3.fromRGB(91, 67, 100)
	str4.Thickness = 1.3
	str4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

	closebttn.MouseEnter:Connect(function()
		ts:Create(str4, TweenInfo.new(0.4), {Color = Color3.fromRGB(186, 139, 206)}):Play()
		ts:Create(closebttn, TweenInfo.new(0.4), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
	end)

	closebttn.MouseLeave:Connect(function()
		ts:Create(str4, TweenInfo.new(0.4), {Color = Color3.fromRGB(91, 67, 100)}):Play()
		ts:Create(closebttn, TweenInfo.new(0.4), {TextColor3 = Color3.fromRGB(235, 159, 221)}):Play()
	end)

	UICorner.CornerRadius = UDim.new(0, 5)
	UICorner.Parent = closebttn

	UICorner_2.Parent = Notification

	local duration = tablen.Duration or 3.5

	ts:Create(Notification, TweenInfo.new(0.5), {Position = UDim2.new(0.81, 0, 0.764779866 - offset, 0)}):Play()

	closebttn.MouseButton1Click:Connect(function()
		ts:Create(Notification, TweenInfo.new(0.3), {Position = UDim2.new(1.3, 0, 0.764779866 - offset, 0)}):Play()
		task.wait(0.8)
		Notification:Destroy()
	end)

	task.wait(duration)

	local out = ts:Create(Notification, TweenInfo.new(0.5), {Position = UDim2.new(1.3, 0, 0.764779866 - offset, 0)})
	out:Play()

	out.Completed:Wait()
	Notification:Destroy()

	while Notification do
		task.wait(0.1)
		local offset = 0
		for _, v in ipairs(Ventures:GetChildren()) do
			if v:IsA("Frame") and v.Name == "Notification" then
				ts:Create(v, TweenInfo.new(0.3), {Position = UDim2.new(0.81, 0, 0.764779866 - offset, 0)}):Play()
				offset = offset + 0.13
			end
		end
	end

	return Notification
end

local function fastnotify(ty)
	if ty == "callback error" then
		lib:Notify({
			Title = "Ventures - Callback Error",
			Content = "there's an erorr at the callback function",
		})
	elseif ty == "library error" then
		lib:Notify({
			Title = "Ventures - Library Error",
			Content = "there's an erorr in the library, please dm sentrysvc for help and what you did to get this erorr.",
		})
	end
end

function lib:CreateWindow(tablew)
	local tab = {}

	local keysystem = tablew.KeySystem
	if type(keysystem) == "table" then
		local enabled, key = keysystem.Enabled or false, keysystem.Key or nil

		if enabled and key ~= nil then
			local KeySystem = Instance.new("Frame")
			local UIGradient = Instance.new("UIGradient")
			local UICorner = Instance.new("UICorner")
			local TextBox = Instance.new("TextBox")
			local UICorner_2 = Instance.new("UICorner")
			local UIPadding = Instance.new("UIPadding")
			local TextLabel = Instance.new("TextLabel")
			local TextLabel_2 = Instance.new("TextLabel")
			local ImageLabel = Instance.new("ImageLabel")
			local UIGradient_2 = Instance.new("UIGradient")
			local Frame = Instance.new("Frame")
			local UIListLayout = Instance.new("UIListLayout")
			local ImageButton = Instance.new("ImageButton")
			local UICorner_3 = Instance.new("UICorner")
			local TextButton = Instance.new("TextButton")
			local UICorner_4 = Instance.new("UICorner")
			local str6 = Instance.new("UIStroke")
			local str7 = Instance.new("UIStroke")
			local str8  = Instance.new("UIStroke")
			local str9 = Instance.new("UIStroke")

			KeySystem.Name = "KeySystem"
			KeySystem.Parent = Ventures
			KeySystem.AnchorPoint = Vector2.new(0.5, 0.5)
			KeySystem.BackgroundColor3 = Color3.fromRGB(31, 23, 34)
			KeySystem.BorderColor3 = Color3.fromRGB(0, 0, 0)
			KeySystem.BackgroundTransparency = 0.09
			KeySystem.BorderSizePixel = 0
			KeySystem.Position = UDim2.new(0.488421053, 0, 1.3, 0) --  UDim2.new(0.488421053, 0, 0.494339615, 0)
			KeySystem.Size = UDim2.new(0, 419, 0, 199)

			str9.Parent = KeySystem
			str9.Color = Color3.fromRGB(91, 67, 100)
			str9.Thickness = 1.3
			str9.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

			UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(72, 72, 72)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
			UIGradient.Rotation = -90
			UIGradient.Parent = KeySystem

			UICorner.Parent = KeySystem

			TextBox.Parent = KeySystem
			TextBox.AnchorPoint = Vector2.new(0.5, 0)
			TextBox.BackgroundColor3 = Color3.fromRGB(31, 23, 34)
			TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextBox.BorderSizePixel = 0
			TextBox.Position = UDim2.new(0.5, 0, 0.707000017, 0)
			TextBox.Size = UDim2.new(0, 287, 0, 27)
			TextBox.Font = Enum.Font.FredokaOne
			TextBox.PlaceholderColor3 = Color3.fromRGB(98, 66, 92)
			TextBox.PlaceholderText = "Input Your Key Here..."
			TextBox.Text = ""
			TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextBox.TextSize = 14.000
			TextBox.TextXAlignment = Enum.TextXAlignment.Left

			str6.Parent = TextBox
			str6.Color = Color3.fromRGB(91, 67, 100)
			str6.Thickness = 1.3
			str6.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

			UICorner_2.CornerRadius = UDim.new(0, 5)
			UICorner_2.Parent = TextBox

			UIPadding.Parent = TextBox
			UIPadding.PaddingLeft = UDim.new(0, 8)

			TextLabel.Parent = KeySystem
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(0.017699115, 0, 0.0384615399, 0)
			TextLabel.Size = UDim2.new(0, 199, 0, 11)
			TextLabel.Font = Enum.Font.FredokaOne
			TextLabel.Text = "Ventures KeySystem"
			TextLabel.TextColor3 = Color3.fromRGB(235, 159, 221)
			TextLabel.TextSize = 14.000
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			TextLabel_2.Parent = KeySystem
			TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_2.BackgroundTransparency = 1.000
			TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel_2.BorderSizePixel = 0
			TextLabel_2.Position = UDim2.new(0.157517895, 0, 0.842481434, 0)
			TextLabel_2.Size = UDim2.new(0, 286, 0, 31)
			TextLabel_2.Font = Enum.Font.FredokaOne
			TextLabel_2.Text = "To get the key join our discord server, discord.gg/v3n"
			TextLabel_2.TextColor3 = Color3.fromRGB(72, 49, 68)
			TextLabel_2.TextSize = 11.000

			ImageLabel.Parent = KeySystem
			ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ImageLabel.BackgroundTransparency = 1.000
			ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ImageLabel.BorderSizePixel = 0
			ImageLabel.Size = UDim2.new(1, 0, 1, 0)
			ImageLabel.Image = "rbxassetid://138515717272375"
			ImageLabel.ImageTransparency = 0.660

			UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
			UIGradient_2.Rotation = -90
			UIGradient_2.Parent = ImageLabel

			Frame.Parent = KeySystem
			Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Frame.BackgroundTransparency = 1.000
			Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame.BorderSizePixel = 0
			Frame.Position = UDim2.new(0.711217165, 0, 0.0351758786, 0)
			Frame.Size = UDim2.new(0, 116, 0, 25)

			UIListLayout.Parent = Frame
			UIListLayout.FillDirection = Enum.FillDirection.Horizontal
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 5)

			ImageButton.Parent = Frame
			ImageButton.BackgroundColor3 = Color3.fromRGB(39, 29, 43)
			ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ImageButton.BorderSizePixel = 0
			ImageButton.Position = UDim2.new(0.75938803, 0, 0.0384615026, 0)
			ImageButton.Size = UDim2.new(0, 25, 0, 25)
			ImageButton.Image = "http://www.roblox.com/asset/?id=84828491431270"
			ImageButton.ImageColor3 = Color3.fromRGB(235, 159, 221)

			str7.Parent = ImageButton
			str7.Color = Color3.fromRGB(91, 67, 100)
			str7.Thickness = 1.3
			str7.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

			UICorner_3.CornerRadius = UDim.new(0, 5)
			UICorner_3.Parent = ImageButton

			TextButton.Parent = Frame
			TextButton.BackgroundColor3 = Color3.fromRGB(39, 29, 43)
			TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextButton.BorderSizePixel = 0
			TextButton.Position = UDim2.new(0.918141603, 0, 0.0384615399, 0)
			TextButton.Size = UDim2.new(0, 25, 0, 25)
			TextButton.Font = Enum.Font.FredokaOne
			TextButton.Text = "X"
			TextButton.TextColor3 = Color3.fromRGB(235, 159, 221)
			TextButton.TextSize = 14.000

			str8.Parent = TextButton
			str8.Color = Color3.fromRGB(91, 67, 100)
			str8.Thickness = 1.3
			str8.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

			UICorner_4.CornerRadius = UDim.new(0, 5)
			UICorner_4.Parent = TextButton

			ts:Create(KeySystem, TweenInfo.new(0.3), {Position =  UDim2.new(0.488421053, 0, 0.494339615, 0)}):Play()

			while KeySystem do
				if TextBox.Text == key then
					ts:Create(KeySystem, TweenInfo.new(0.3), {Position =  UDim2.new(0.488421053, 0, 1.3, 0)}):Play()
					task.wait(0.8)
					KeySystem:Destroy()
					break
				else

				end
				task.wait(0.1)
			end
		end
	end

	local TabName2 = Instance.new("TextLabel")
	local Holder = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local SideBar = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local Logo = Instance.new("ImageLabel")
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	local Line = Instance.new("Frame")
	local Line_2 = Instance.new("Frame")
	local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
	local TabContainer1 = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local UIAspectRatioConstraint_30 = Instance.new("UIAspectRatioConstraint")
	local UIGradient = Instance.new("UIGradient")
	local UIGradient_2 = Instance.new("UIGradient")
	local UIGradient_3 = Instance.new("UIGradient")
	local ImageLabel = Instance.new("ImageLabel")
	local UIAspectRatioConstraint_31 = Instance.new("UIAspectRatioConstraint")

	Holder.Name = "Holder"
	Holder.Parent = Ventures
	Holder.BackgroundColor3 = Color3.fromRGB(31, 23, 34)
	Holder.BackgroundTransparency = 0.06
	Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Holder.BorderSizePixel = 0
	Holder.Position = UDim2.new(0.5, -329, 0.5, -260)
	Holder.Size = UDim2.new(0.590943992, 0, 0.65408808, 0)

	ImageLabel.Parent = Holder
	ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageLabel.BackgroundTransparency = 1.000
	ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ImageLabel.BorderSizePixel = 0
	ImageLabel.Size = UDim2.new(1, 0, 1, 0)
	ImageLabel.Image = "rbxassetid://138515717272375"
	ImageLabel.ImageColor3 = Color3.fromRGB(177, 177, 177)
	ImageLabel.ImageTransparency = 0.910

	UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(188, 188, 188)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
	UIGradient_3.Rotation = -90
	UIGradient_3.Parent = ImageLabel

	UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(72, 72, 72)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
	UIGradient_2.Rotation = -90
	UIGradient_2.Parent = Holder

	UICorner.Parent = Holder

	SideBar.Name = "Side Bar"
	SideBar.Parent = Holder
	SideBar.BackgroundColor3 = Color3.fromRGB(31, 23, 34)
	SideBar.BackgroundTransparency = 0.8
	SideBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SideBar.BorderSizePixel = 0
	SideBar.Size = UDim2.new(0.129870132, 0, 1, 0)

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(72, 72, 72)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
	UIGradient.Rotation = -90
	UIGradient.Parent = SideBar

	UICorner_2.Parent = SideBar

	Logo.Name = "Logo"
	Logo.Parent = SideBar
	Logo.BackgroundColor3 = Color3.fromRGB(235, 159, 221)
	Logo.BackgroundTransparency = 1.000
	Logo.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Logo.BorderSizePixel = 0
	Logo.Position = UDim2.new(0.0700000003, 0, 0, 0)
	Logo.Size = UDim2.new(0.850000024, 0, 0.163461536, 0)
	Logo.Image = "rbxassetid://138872283376721"
	Logo.ImageColor3 = Color3.fromRGB(235, 159, 221)

	UIAspectRatioConstraint.Parent = Logo

	Line.Name = "Line"
	Line.Parent = SideBar
	Line.BackgroundColor3 = Color3.fromRGB(58, 32, 61)
	Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Line.BorderSizePixel = 0
	Line.Position = UDim2.new(0, 0, 0.165000007, 0)
	Line.Size = UDim2.new(1, 0, 0.002,0)

	Line_2.Name = "Line"
	Line_2.Parent = SideBar
	Line_2.BackgroundColor3 = Color3.fromRGB(58, 32, 61)
	Line_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Line_2.BorderSizePixel = 0
	Line_2.Position = UDim2.new(1, 0, 0, 0)
	Line_2.Size = UDim2.new(-0.00999999978, 0, 1, 0)

	TabContainer1.Name = "Tab Container1"
	TabContainer1.Parent = SideBar
	TabContainer1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabContainer1.BackgroundTransparency = 1.000
	TabContainer1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabContainer1.BorderSizePixel = 0
	TabContainer1.Position = UDim2.new(-0.00999999978, 0, 0.186538458, 0)
	TabContainer1.Size = UDim2.new(1, 0, 0.698076904, 0)

	UIListLayout.Parent = TabContainer1
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 15)

	function tab:CreateTab(tablet)
		local holders = {}
		local element = {}
		local selected = nil

		local Tab = Instance.new("Frame")
		local UICorner_3 = Instance.new("UICorner")
		local TabIcon = Instance.new("ImageLabel")
		local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
		local UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")
		local TextButton = Instance.new("TextButton")
		local UIAspectRatioConstraint_5 = Instance.new("UIAspectRatioConstraint")
		local UIAspectRatioConstraint_6 = Instance.new("UIAspectRatioConstraint")
		local CornerFrame = Instance.new("Frame")
		local UIAspectRatioConstraint_7 = Instance.new("UIAspectRatioConstraint")
		local TabContainer2 = Instance.new("Frame")
		local UIListLayout_2 = Instance.new("UIListLayout")
		local TabHolder = Instance.new("Frame")
		local UIListLayout_3 = Instance.new("UIListLayout")
		local str2 = Instance.new("UIStroke")

		local function fetchicon(name)
			for k, v in pairs(lucide) do
				if k:find(name) then
					return v 
				end
			end
		end

		Tab.Name = tablet.Name or "Tab"
		Tab.Parent = TabContainer1
		Tab.BackgroundColor3 = Color3.fromRGB(46, 38, 48)
		Tab.BackgroundTransparency = 0.700
		Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Tab.BorderSizePixel = 0
		Tab.Position = UDim2.new(0, 0, 0.140495867, 0)
		Tab.Size = UDim2.new(0.529999971, 0, 0.146005511, 0)

		str2.Parent = Tab
		str2.Name = "str2"
		str2.Color = Color3.fromRGB(91, 67, 100)
		str2.Transparency = 0
		str2.Thickness = 1.3

		Tab.MouseEnter:Connect(function()
			ts:Create(str2, TweenInfo.new(0.4), {Color = Color3.fromRGB(186, 139, 206)}):Play()
		end)

		Tab.MouseLeave:Connect(function()
			ts:Create(str2, TweenInfo.new(0.4), {Color = Color3.fromRGB(91, 67, 100)}):Play()
		end)

		UICorner_3.Parent = Tab

		TabIcon.Name = "Tab Icon"
		TabIcon.Parent = Tab
		TabIcon.AnchorPoint = Vector2.new(0.5,0.5)
		TabIcon.BackgroundColor3 = Color3.fromRGB(235, 159, 221)
		TabIcon.BackgroundTransparency = 1.000
		TabIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabIcon.BorderSizePixel = 0
		TabIcon.Position = UDim2.new(0.5, 0, 0.5,0)
		TabIcon.Size = UDim2.new(0.6, 0, 0.734716992, 0)
		TabIcon.Image = fetchicon(tablet.Icon) or lucide["lucide-pin"]
		TabIcon.ImageColor3 = Color3.fromRGB(235, 159, 221)

		UIAspectRatioConstraint_3.Parent = TabIcon
		UIAspectRatioConstraint_3.AspectRatio = 1.000

		UIAspectRatioConstraint_4.Parent = Tab
		UIAspectRatioConstraint_4.AspectRatio = 1.000

		TextButton.Parent = Tab
		TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextButton.BackgroundTransparency = 1.000
		TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextButton.BorderSizePixel = 0
		TextButton.Size = UDim2.new(1, 0, 1, 0)
		TextButton.Font = Enum.Font.SourceSans
		TextButton.Text = " "
		TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
		TextButton.TextSize = 14.000

		UIAspectRatioConstraint_5.Parent = TabContainer1
		UIAspectRatioConstraint_5.AspectRatio = 0.275

		UIAspectRatioConstraint_6.Parent = SideBar
		UIAspectRatioConstraint_6.AspectRatio = 0.192

		UIAspectRatioConstraint_7.Parent = CornerFrame
		UIAspectRatioConstraint_7.AspectRatio = 0.017

		TabContainer2.Name = tablet.Name or  "Tabcontainer"
		TabContainer2.Parent = Holder
		TabContainer2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabContainer2.BackgroundTransparency = 1.000
		TabContainer2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabContainer2.BorderSizePixel = 0
		TabContainer2.Visible = false
		TabContainer2.Position = UDim2.new(0.140000002, 0, 0.0710000023, 0)
		TabContainer2.Size = UDim2.new(0.758441567, 0, 0.909615397, 0)

		local UIListLayout = Instance.new("UIListLayout")
		UIListLayout.Parent = TabContainer2
		UIListLayout.Wraps = true
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 10)

		TabName2.Name = "Tab Name2"
		TabName2.Parent = Holder
		TabName2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabName2.BackgroundTransparency = 1.000
		TabName2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabName2.BorderSizePixel = 0
		TabName2.Position = UDim2.new(0.149079561, 0, 0.0134615386, 0)
		TabName2.Size = UDim2.new(0.709090889, 0, 0.0423076935, 0)
		TabName2.Font = Enum.Font.SourceSansBold
		TabName2.Text = tablet.Name or "you forgot to set the name lel"
		TabName2.TextColor3 = Color3.fromRGB(235, 159, 221)
		TabName2.TextSize = 20.000
		TabName2.TextXAlignment = Enum.TextXAlignment.Left

		UIAspectRatioConstraint_30.Parent = TabName2
		UIAspectRatioConstraint_30.AspectRatio = 24.818

		UIAspectRatioConstraint_31.Parent = Holder
		UIAspectRatioConstraint_31.AspectRatio = 1.48

		if tablet.Holders then
			for h, d in pairs(tablet.Holders) do
				local holder = Instance.new("Frame")
				holder.Name = h
				holder.Parent = TabContainer2
				holder.BackgroundColor3 = Color3.fromRGB(31, 23, 34)
				holder.BackgroundTransparency = 0.3
				holder.Size = UDim2.new(0.55, 0, d.Width or 0.46, 0)

				local UIListLayout = Instance.new("UIListLayout")
				UIListLayout.Parent = holder
				UIListLayout.FillDirection = Enum.FillDirection.Vertical
				UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
				UIListLayout.Padding = UDim.new(0, 10)

				local UICorner_6 = Instance.new("UICorner")
				UICorner_6.Parent = holder

				local UIPadding = Instance.new("UIPadding")
				UIPadding.Parent = holder
				UIPadding.PaddingTop = UDim.new(0, 13)

				local str3 = Instance.new("UIStroke")
				str3.Parent = holder
				str3.Color = Color3.fromRGB(91, 67, 100)
				str3.Thickness = 1.3

				local function gettab(tabtype)
					if tabtype == "first" and #TabContainer1:GetChildren() > 0 then
						for _, v in pairs(TabContainer1:GetChildren()) do
							if v:IsA("Frame") then
								return v
							end
						end
					end
					return nil
				end

				local function getcontainer(name)
					for _, v in pairs(Holder:GetChildren()) do
						if v.Name == name then
							return v
						end
					end
					return nil
				end

				local function fade(container, way)
					local tweens = {}

					for _, holder in pairs(container:GetChildren()) do
						if holder:IsA("Frame") then
							local strn = holder:FindFirstChild("UIStroke")
							if not strn then
								lib:Notify({
									Title = "Ventures - Library Error",
									Content = "UIStroke not found for holder: " .. holder.Name .. ". Please check the structure."
								})
								return
							end

							if way then
								if way == "in" then
									for _, v in pairs(holder:GetDescendants()) do
										if v:IsA("GuiObject") then v.Visible = true end
									end
									local holderTween = ts:Create(holder, TweenInfo.new(0.4), {
										Position = UDim2.new(0.008, 0, 0, 0),
										BackgroundTransparency = 0.45
									})
									table.insert(tweens, holderTween)

									local strnTween = ts:Create(strn, TweenInfo.new(0.4), {Transparency = 0})
									table.insert(tweens, strnTween)
								elseif way == "out" then
									local holderTween = ts:Create(holder, TweenInfo.new(0.4), {
										Position = UDim2.new(0.008, 0, 0.2, 0),
										BackgroundTransparency = 1
									})
									table.insert(tweens, holderTween)

									local strnTween = ts:Create(strn, TweenInfo.new(0.4), {Transparency = 1})
									table.insert(tweens, strnTween)

									for _, v in pairs(holder:GetDescendants()) do
										if v:IsA("GuiObject") then v.Visible = false end
									end
								end
							end
						end
					end

					for _, tween in pairs(tweens) do
						tween:Play()
					end
				end


				if gettab("first") then
					selected = gettab("first")
					if selected then
						selected.BackgroundTransparency = 0

						local container = getcontainer(selected.Name)
						if container then
							container.Visible = true
						else
							fastnotify("library error")
						end
					end
				else
					fastnotify("library error")
				end

				local function settab(tab)
					local container = getcontainer(tab.Name)
					if container then
						container.Visible = true
						fade(container, "in")
					end
				end

				local function hide(tab)
					local container = getcontainer(tab.Name)
					if container then
						fade(container, "out")
						task.delay(0.4, function()
							container.Visible = false
						end)
					end
				end

				local canchange = true
				for _, v in pairs(TabContainer1:GetChildren()) do
					if v:IsA("Frame") and v:FindFirstChild("TextButton") then
						local bttn = v:FindFirstChild("TextButton")

						bttn.MouseButton1Click:Connect(function()
							if canchange and bttn.Parent ~= selected then
								canchange = false

								if selected then
									hide(selected)
									ts:Create(selected, TweenInfo.new(0.4), {BackgroundTransparency = 1.000}):Play()
								end

								selected = bttn.Parent
								settab(selected)
								ts:Create(selected, TweenInfo.new(0.4), {BackgroundTransparency = 0}):Play()

								task.delay(0.4, function()
									canchange = true
								end)
							end
						end)
					end
				end


				holders[h] = holder

			end
		end



		function element:CreateToggle(tablef)
			local parent = holders[tablef.Parented or "1"]

			if not parent then
				lib:Notify({
					Title = "Ventures - CallBack Error",
					Content = "Parent failed, make sure the toggle parent is set correctly."
				})
				return
			end

			local toggle = Instance.new("Frame")
			local toggleame = Instance.new("TextLabel")
			local UIAspectRatioConstraint_8 = Instance.new("UIAspectRatioConstraint")
			local ToggleHolder = Instance.new("Frame")
			local UICorner_4 = Instance.new("UICorner")
			local Toggler = Instance.new("TextButton")
			local UICorner_5 = Instance.new("UICorner")
			local UIAspectRatioConstraint_9 = Instance.new("UIAspectRatioConstraint")
			local UIAspectRatioConstraint_10 = Instance.new("UIAspectRatioConstraint")
			local UIAspectRatioConstraint_11 = Instance.new("UIAspectRatioConstraint")
			local UIPadding = Instance.new("UIPadding")
			local UICorner_6 = Instance.new("UICorner")
			local togglea = Instance.new("Frame")
			local toggleame_2 = Instance.new("TextLabel")
			local UIAspectRatioConstraint_12 = Instance.new("UIAspectRatioConstraint")
			local ToggleHolder_2 = Instance.new("Frame")
			local UICorner_7 = Instance.new("UICorner")
			local Toggler_2 = Instance.new("TextButton")
			local UICorner_8 = Instance.new("UICorner")
			local UIAspectRatioConstraint_13 = Instance.new("UIAspectRatioConstraint")
			local UIAspectRatioConstraint_14 = Instance.new("UIAspectRatioConstraint")
			local UIAspectRatioConstraint_15 = Instance.new("UIAspectRatioConstraint")
			local str = Instance.new("UIStroke") --Gui2Lua dosent save strokes for some reason.

			toggle.Name = "togglea"
			toggle.Parent = parent
			toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			toggle.BackgroundTransparency = 1.000
			toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			toggle.BorderSizePixel = 0
			toggle.Position = UDim2.new(-0.0571428575, 0, 0.156097561, 0)
			toggle.Size = UDim2.new(0.949206352, 0, 0.101, 0)

			local uia = Instance.new("UIAspectRatioConstraint")
			uia.Parent = toggle
			uia.AspectRatio = 14.453
			uia.DominantAxis = Enum.DominantAxis.Width

			toggleame.Name = "togglename"
			toggleame.Parent = toggle
			toggleame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			toggleame.BackgroundTransparency = 1.000
			toggleame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			toggleame.BorderSizePixel = 0
			toggleame.Size = UDim2.new(0.819151342, 0, 1, 0)
			toggleame.Font = Enum.Font.SourceSansBold
			toggleame.Text = tablef.Name or "Toggle"
			toggleame.TextColor3 = Color3.fromRGB(83, 57, 88)
			toggleame.TextSize = 17.000
			toggleame.TextXAlignment = Enum.TextXAlignment.Left

			UIAspectRatioConstraint_8.Parent = toggleame
			UIAspectRatioConstraint_8.AspectRatio = 11.839

			ToggleHolder.Name = "ToggleHolder"
			ToggleHolder.Parent = toggle
			ToggleHolder.BackgroundColor3 = Color3.fromRGB(56, 41, 63) -- Color3.fromRGB(42, 45, 63)
			ToggleHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ToggleHolder.BackgroundTransparency = 0.45
			ToggleHolder.BorderSizePixel = 0
			ToggleHolder.Position = UDim2.new(0.818799496, 0, 0, 0)
			ToggleHolder.Size = UDim2.new(0.167224079, 0, 1, 0)

			UICorner_4.Parent = ToggleHolder

			Toggler.Name = "Toggler"
			Toggler.Parent = ToggleHolder
			Toggler.AutoButtonColor = false
			Toggler.BackgroundColor3 = Color3.fromRGB(94, 93, 104) --Color3.fromRGB(235, 159, 221)
			Toggler.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Toggler.BorderSizePixel = 0
			Toggler.Position = UDim2.new(0.159999996, 0, 0.5, -6)
			Toggler.Size = UDim2.new(0.239999995, 0, 0.545454562, 0)
			Toggler.Font = Enum.Font.SourceSans
			Toggler.Text = ""
			Toggler.TextColor3 = Color3.fromRGB(0, 0, 0)
			Toggler.TextSize = 14.000

			str.Parent = ToggleHolder
			str.Color = Color3.fromRGB(235, 159, 221)
			str.Thickness = 1.6
			str.Transparency = 1

			UICorner_5.CornerRadius = UDim.new(1, 0)
			UICorner_5.Parent = Toggler

			local callback = tablef.CallBack
			local bool = tablef.Default or false

			Toggler.MouseButton1Click:Connect(function()
				bool = not bool

				if bool then
					ts:Create(Toggler, TweenInfo.new(0.4), {BackgroundColor3 = Color3.fromRGB(235, 159, 221)}):Play()
					ts:Create(Toggler, TweenInfo.new(0.4), {Position = UDim2.new(0.680000007, 0, 0.5, -6)}):Play()
					ts:Create(ToggleHolder, TweenInfo.new(0.4), {BackgroundColor3 =  Color3.fromRGB(42, 45, 63)}):Play()
					ts:Create(toggleame, TweenInfo.new(0.4), {TextColor3 = Color3.fromRGB(255,255,255)}):Play()
					ts:Create(str, TweenInfo.new(0.4), {Transparency = 0}):Play()
				else
					ts:Create(Toggler, TweenInfo.new(0.4), {BackgroundColor3 = Color3.fromRGB(94, 93, 104)}):Play()
					ts:Create(Toggler, TweenInfo.new(0.4), {Position = UDim2.new(0.159999996, 0, 0.5, -6)}):Play()
					ts:Create(ToggleHolder, TweenInfo.new(0.4), {BackgroundColor3 =  Color3.fromRGB(56, 41, 63)}):Play()
					ts:Create(toggleame, TweenInfo.new(0.4), {TextColor3 = Color3.fromRGB(83, 57, 88)}):Play()
					ts:Create(str, TweenInfo.new(0.4), {Transparency = 1}):Play()
				end

				if type(callback) == "function" then
					callback(bool)
				else
					lib:Notify({
						Title = "Ventures - Callback error",
						Content = "Use a function for callback: " .. toggleame.Text
					})
					return
				end
			end)
		end

		function element:CreateSlider(tables)
			local parent = holders[tables.Parented or "1"]

			if not parent then
				lib:Notify({
					Title = "Ventures - CallBack Error",
					Content = "Parent failed, make sure the slider parent is set correctly."
				})
				return
			end


			local slider = Instance.new("Frame")
			local name = Instance.new("TextLabel")
			local UIAspectRatioConstraint_16 = Instance.new("UIAspectRatioConstraint")
			local ammount = Instance.new("Frame")
			local UICorner_9 = Instance.new("UICorner")
			local numericvalue = Instance.new("TextLabel")
			local UIAspectRatioConstraint_17 = Instance.new("UIAspectRatioConstraint")
			local UIAspectRatioConstraint_18 = Instance.new("UIAspectRatioConstraint")
			local sliderholder = Instance.new("Frame")
			local UICorner_10 = Instance.new("UICorner")
			local percent = Instance.new("Frame")
			local UIAspectRatioConstraint_19 = Instance.new("UIAspectRatioConstraint")
			local dragger = Instance.new("TextButton")
			local UICorner_11 = Instance.new("UICorner")
			local UIAspectRatioConstraint_20 = Instance.new("UIAspectRatioConstraint")
			local UIAspectRatioConstraint_21 = Instance.new("UIAspectRatioConstraint")
			local UIAspectRatioConstraint_22 = Instance.new("UIAspectRatioConstraint")

			local min, max, default, increment = tables.MinValue, tables.MaxValue, tables.DefaultValue, tables.Increment
			local callmyback = tables.CallBack

			slider.Name = "slider"
			slider.Parent = parent
			slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			slider.BackgroundTransparency = 1.000
			slider.Position = UDim2.new(-0.0571428575, 0, 0.312195122, 0)
			slider.Size = UDim2.new(0.949206352, 0, 0.100917429, 0)

			name.Name = "name"
			name.Parent = slider
			name.BackgroundTransparency = 1.000
			name.Position = UDim2.new(-0.00246416684, 0, 0, 0)
			name.Size = UDim2.new(0.551417112, 0, 1, 0)
			name.Font = Enum.Font.SourceSansBold
			name.Text = tables.Name or "Slider"
			name.TextColor3 = Color3.fromRGB(240, 255, 250)
			name.TextSize = 17.000
			name.TextXAlignment = Enum.TextXAlignment.Left

			UIAspectRatioConstraint_16.Parent = name
			UIAspectRatioConstraint_16.AspectRatio = 7.970

			ammount.Name = "ammount"
			ammount.Parent = slider
			ammount.BackgroundColor3 = Color3.fromRGB(56, 41, 63)
			ammount.Position = UDim2.new(0.862453878, 0, 0, 0)
			ammount.Size = UDim2.new(0.120401338, 0, 1, 0)

			UICorner_9.CornerRadius = UDim.new(0, 6)
			UICorner_9.Parent = ammount

			numericvalue.Name = "numeric value"
			numericvalue.Parent = ammount
			numericvalue.BackgroundTransparency = 1.000
			numericvalue.Size = UDim2.new(1, 0, 1, 0)
			numericvalue.Font = Enum.Font.SourceSansBold
			numericvalue.Text = tostring(default)
			numericvalue.TextColor3 = Color3.fromRGB(255, 255, 255)
			numericvalue.TextSize = 20.000
			numericvalue.TextWrapped = true

			UIAspectRatioConstraint_17.Parent = numericvalue
			UIAspectRatioConstraint_17.AspectRatio = 1.740

			UIAspectRatioConstraint_18.Parent = ammount
			UIAspectRatioConstraint_18.AspectRatio = 1.740

			sliderholder.Name = "sliderholder"
			sliderholder.Parent = slider
			sliderholder.BackgroundColor3 = Color3.fromRGB(56, 41, 63)
			sliderholder.Position = UDim2.new(0.50836122, 0, 0.431818187, 0)
			sliderholder.Size = UDim2.new(0.334448159, 0, 0.0909090936, 0)

			UICorner_10.CornerRadius = UDim.new(0, 6)
			UICorner_10.Parent = sliderholder

			percent.Name = "percent"
			percent.Parent = sliderholder
			percent.BackgroundColor3 = Color3.fromRGB(235, 159, 221)  
			percent.Size = UDim2.new(0, 0, 1, 0)

			dragger.Name = "dragger"
			dragger.Parent = sliderholder
			dragger.BackgroundColor3 = Color3.fromRGB(235, 159, 221)
			dragger.Position = UDim2.new(0, 0, 0.5, -6)
			dragger.Size = UDim2.new(0.119999997, 0, 6, 0)
			dragger.Font = Enum.Font.SourceSansBold
			dragger.Text = ""
			dragger.TextSize = 14.000

			UICorner_11.CornerRadius = UDim.new(1, 0)
			UICorner_11.Parent = dragger

			UIAspectRatioConstraint_20.Parent = dragger
			UIAspectRatioConstraint_20.AspectRatio = 1.063

			UIAspectRatioConstraint_21.Parent = sliderholder
			UIAspectRatioConstraint_21.AspectRatio = 53.171

			UIAspectRatioConstraint_22.Parent = slider
			UIAspectRatioConstraint_22.AspectRatio = 14.453

			local value = default or min
			local dragging = false

			dragger.MouseButton1Down:Connect(function()
				dragging = true
			end)

			uis.InputEnded:Connect(function(inp)
				if inp.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = false
				end
			end)

			run.RenderStepped:Connect(function()
				if dragging then
					local pos = uis:GetMouseLocation().X
					local abss = sliderholder.AbsolutePosition.X
					local widthq = sliderholder.AbsoluteSize.X  

					local percentv = math.clamp((pos - abss) / widthq, 0, 1)
					dragger.Position = UDim2.new(percentv, 0, 0.5, -6)
					percent.Size = UDim2.new(percentv, 0, 1, 0)

					value = math.floor(((min + ((max - min) * percentv)) / increment) + 0.5) * increment
					numericvalue.Text = tostring(math.round(value))

					if type(callmyback) == "function" then
						callmyback(value)
					end
				end
			end)
		end

		function element:CreateButton(tablebb)
			--soon
		end

		function element:CreateDropdown(tabled)
			local dropdown = Instance.new("Frame")
			local TextLabel_3 = Instance.new("TextLabel")
			local UIAspectRatioConstraint_23 = Instance.new("UIAspectRatioConstraint")
			local Frame_4 = Instance.new("Frame")
			local UICorner_12 = Instance.new("UICorner")
			local TextLabel_4 = Instance.new("TextLabel")
			local UIAspectRatioConstraint_24 = Instance.new("UIAspectRatioConstraint")
			local ImageButton = Instance.new("ImageButton")
			local UIAspectRatioConstraint_25 = Instance.new("UIAspectRatioConstraint")
			local UIAspectRatioConstraint_26 = Instance.new("UIAspectRatioConstraint")
			local UIAspectRatioConstraint_27 = Instance.new("UIAspectRatioConstraint")
			local UIAspectRatioConstraint_28 = Instance.new("UIAspectRatioConstraint")
			local UIAspectRatioConstraint_29 = Instance.new("UIAspectRatioConstraint")
			local UIAspectRatioConstraint_32 = Instance.new("UIAspectRatioConstraint")

			dropdown.Name = "dropdown"
			dropdown.Parent = TabHolder
			dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			dropdown.BackgroundTransparency = 1.000
			dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
			dropdown.BorderSizePixel = 0
			dropdown.Position = UDim2.new(-0.0571428575, 0, 0.312195122, 0)
			dropdown.Size = UDim2.new(0.949206352, 0, 0.100917429, 0)

			TextLabel_3.Parent = dropdown
			TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_3.BackgroundTransparency = 1.000
			TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel_3.BorderSizePixel = 0
			TextLabel_3.Position = UDim2.new(-0.00246416684, 0, 0, 0)
			TextLabel_3.Size = UDim2.new(0.551417112, 0, 1, 0)
			TextLabel_3.Font = Enum.Font.SourceSansBold
			TextLabel_3.Text = tabled.Name or "Dropdown"
			TextLabel_3.TextColor3 = Color3.fromRGB(48, 51, 50)
			TextLabel_3.TextSize = 17.000
			TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left

			UIAspectRatioConstraint_23.Parent = TextLabel_3
			UIAspectRatioConstraint_23.AspectRatio = 7.970

			Frame_4.Parent = dropdown
			Frame_4.BackgroundColor3 = Color3.fromRGB(26, 28, 32)
			Frame_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame_4.BorderSizePixel = 0
			Frame_4.Position = UDim2.new(0.548953056, 0, 0, 0)
			Frame_4.Size = UDim2.new(0.431438118, 0, 1, 0)

			UICorner_12.CornerRadius = UDim.new(0, 6)
			UICorner_12.Parent = Frame_4

			TextLabel_4.Parent = Frame_4
			TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_4.BackgroundTransparency = 1.000
			TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel_4.BorderSizePixel = 0
			TextLabel_4.Position = UDim2.new(0.0465116277, 0, 0, 0)
			TextLabel_4.Size = UDim2.new(0.733985126, 0, 1, 0)
			TextLabel_4.Font = Enum.Font.SourceSansBold
			TextLabel_4.Text = "Head"
			TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_4.TextSize = 17.000
			TextLabel_4.TextWrapped = true
			TextLabel_4.TextXAlignment = Enum.TextXAlignment.Left

			UIAspectRatioConstraint_24.Parent = TextLabel_4
			UIAspectRatioConstraint_24.AspectRatio = 4.577

			ImageButton.Parent = Frame_4
			ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ImageButton.BackgroundTransparency = 1.000
			ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ImageButton.BorderSizePixel = 0
			ImageButton.Position = UDim2.new(0.831248045, 0, -2.38418579e-07, 0)
			ImageButton.Size = UDim2.new(0.16875194, 0, 1.00000048, 0)
			ImageButton.Image = "http://www.roblox.com/asset/?id=11552476728"
			ImageButton.ImageColor3 = Color3.fromRGB(78, 83, 81)

			UIAspectRatioConstraint_25.Parent = ImageButton
			UIAspectRatioConstraint_25.AspectRatio = 1.052

			UIAspectRatioConstraint_26.Parent = Frame_4
			UIAspectRatioConstraint_26.AspectRatio = 6.235

			UIAspectRatioConstraint_27.Parent = dropdown
			UIAspectRatioConstraint_27.AspectRatio = 14.453

			UIAspectRatioConstraint_29.Parent = TabContainer2
			UIAspectRatioConstraint_29.AspectRatio = 1.190
		end

		return element
	end
	return tab
end

return lib
