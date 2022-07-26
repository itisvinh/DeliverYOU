<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html class="vh-100 w-100">

<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>

<body class="h-100" style="overflow-y: auto">

<script>
    function inIframe() {
        try {
            return window.self !== window.top;
        } catch (e) {
            return true;
        }
    }

    if (!inIframe()) {
        console.log(34234324)
        window.stop()
        const body = document.querySelector('body')
        body.classList.add('m-auto', 'fw-bold', 'fs-2')
        body.innerHTML = `<div>This page can only be loaded inside an iframe</div>`
    }
</script>

<style>
    .col {
        width: 100%;
        position: relative;
    }

    .card {
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        width: 100%;
        min-width: 10rem;
        min-height: 10rem;
        position: relative;
        transition: all .2s ease-in-out;
        max-width: 40rem;
    }

    .card::before {
        content: "";
        width: 1rem;
        height: 1rem;
        background: rgb(195, 195, 195);
        border-radius: .5rem;
        position: absolute;
        left: .5rem;
        top: .5rem;
        transition: all .2s ease-in-out;
    }

    .card .digit {
        background: rgb(195, 195, 195);
        min-width: 2.5rem;
        padding: .2rem 1rem;
        border-radius: 1.5rem;
        text-align: center;
    }

    .card:hover:before {
        background: rgb(160, 160, 160);
    }

    .card:hover {
        background: rgba(233, 233, 233, 0.845);
    }

    input[name="date-range-picker"],
    .picker {
        border-radius: 1rem;
        border: 1px solid rgb(201, 201, 201);
        background: rgb(225, 225, 225);
        padding: .1rem 1rem;
        cursor: pointer;
        transition: all .2s ease-in-out;
    }

    input[name="date-range-picker"]:hover {
        background: rgb(207, 207, 207);
    }

    .padding-bottom-5 {
        padding-bottom: 5rem !important;
    }
</style>

<div id="main-container" class="container-fluid p-3" style="overflow-y: auto; padding-bottom: 10rem !important;">
    <div class="d-flex flex-column align-items-center w-100">
        <button class="btn mt-0 mb-3 bg-primary text-white rounded-pill p-1 text-center" style="width: 10rem;"
                data-bs-toggle="collapse" href="#general-reports" aria-expanded="true">
            <span><i class="bi bi-check-all"></i></span>
            General Reports
        </button>

        <div class="w-100 collapse show" id="general-reports">
            <div class="row">

                <div class="col d-flex align-items-center justify-content-center">
                    <div class="card shadow p-2 mb-2">
                        <div class="title fw-semibold text-center mb-2">Registered Drivers</div>
                        <div id="stat-total-drivers" class="digit fw-bold fs-4 bg-warning text-white text-center">50</div>
                    </div>
                </div>

                <div class="col d-flex align-items-center justify-content-center">
                    <div class="card shadow p-2 mb-2">
                        <div class="fw-semibold text-center mb-2">All User's Posts</div>
                        <div id="stat-total-post" class="digit fw-bold fs-4 text-white bg-info text-center">1.2K</div>
                    </div>
                </div>

                <div class="col d-flex align-items-center justify-content-center">
                    <div class="card shadow p-2 mb-2">
                        <div class="fw-semibold text-center mb-2">Registered Users</div>
                        <div id="stat-total-users" class="digit fw-bold fs-4 text-white bg-danger text-center">120</div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="d-flex flex-column align-items-center w-100">
        <button class="btn mx-auto mt-4 mb-3 bg-warning rounded-pill p-1 text-center" style="width: 12rem;"
                data-bs-toggle="collapse" href="#periodically-reports" aria-expanded="true">
            <span><i class="bi bi-calendar-date-fill me-1"></i></span>
            Periodically Reports
        </button>

        <div class="w-100 collapse show d-flex flex-column align-items-center" id="periodically-reports">
            <div class="d-flex mt-1">
                <div class="form-check me-3">
                    <input onchange="radioChecked(this)" data-type="month" class="form-check-input" type="radio"
                           name="flexRadioDefault" id="radio-month-picker" checked>
                    <label class="form-check-label" for="month-picker">By month</label>
                    <input onchange="monthPickerSelected(this)" id="month-picker" class="picker me-2" type="month"
                           name="month-picker">
                </div>
                <div class="form-check">
                    <input onchange="radioChecked(this)" data-type="date-range" class="form-check-input" type="radio"
                           name="flexRadioDefault" id="radio-range-picker">
                    <label class="form-check-label" for="date-range-picker">By date range</label>
                    <input onmouseup="dateRangePickerMarginBottom()" class="picker d-none" type="text"
                           name="date-range-picker" id="date-range-picker">
                </div>
            </div>

            <div class="w-100 mt-3 d-flex flex-column align-items-center">

                <div class="card shadow">
                    <div class="fw-semibold text-center mt-2" style="height: 2rem;">
                        Monthly Revanue Growth
                    </div>
                    <div id="revanue-line-chart"
                         class="d-flex align-items-center justify-content-center flex-column w-100"
                         style="overflow: hidden;"></div>
                </div>

                <div class="card shadow mt-2">
                    <div id="pie-chart" class="d-flex align-items-center justify-content-center flex-column"
                         style="overflow: hidden;"></div>
                </div>

            </div>

        </div>

    </div>

</div>

<div id="endpoint" data-endpoint="<c:url value="/"/>"></div>

<script src="<c:url value="/js/util.js"/>"></script>
<script defer>
    const MONTH_PICKER = document.querySelector('#month-picker')
    const STAT_DRIVERS = document.querySelector('#stat-total-drivers')
    const STAT_USERS = document.querySelector('#stat-total-users')
    const STAT_POSTS = document.querySelector('#stat-total-post')
    const ENDPOINT = document.querySelector('#endpoint').dataset.endpoint

    function iniStats() {
        STAT_DRIVERS.innerHTML = '0'
        STAT_USERS.innerHTML = '0'
        STAT_POSTS.innerHTML = '0'
        updateStats()
    }

    iniStats()

    function updateStats() {
        Fetch.build().method(Fetch.METHOD_POST).fetchBodySingleResult(ENDPOINT + 'admin/api/count-users/driver')
            .then(count => STAT_DRIVERS.innerHTML = count ? count : 0)

        Fetch.build().fetchBodySingleResult(ENDPOINT + 'common/api/get-total-posts')
            .then(count => STAT_POSTS.innerHTML = count ? count : 0)

        Fetch.build().method(Fetch.METHOD_POST).fetchBodySingleResult(ENDPOINT + 'admin/api/count-users/user')
            .then(count => STAT_USERS.innerHTML = count ? count : 0)



    }


    function setMonthPickerCurrentMonth() {
        const date = new Date()
        const year = date.getFullYear()
        const month = date.getMonth()
        MONTH_PICKER.value = year + '-' + (month < 10 ? '0' + month : month)
        performSearchByMonth(year, month)
    }

    setMonthPickerCurrentMonth()

    function performSearchByMonth(year, month) {
        //dsjfnksjdbfkjsbfksdbfksjbfksdbfksdbjfkjsdbfskdjfbksjdfkdjfb
        console.log('[SEARCH]', month + " - " + year)
    }

    function performSearchByDateRange(start, end) {
        //dsjfnksjdbfkjsbfksdbfksjbfksdbfksdbjfkjsdbfskdjfbksjdfkdjfb
        const start_date = new Date(start)
        const end_date = new Date(end)

        console.log('[SEARCH]', start_date + " - " + end_date)
    }

    function monthPickerSelected(input) {
        if (input.value && input.value.trim() !== "") {

            const list = input.value.split('-')
            const year = list[0]
            const month = list[1]
            performSearchByMonth(year, month)

        } else {
            throw 'Month Picker value is null'
        }
    }

    // -------------------------------

    $(function () {
        $('input[name="date-range-picker"]').daterangepicker({
            opens: 'left'
        }, function (start, end, label) {
            performSearchByDateRange(start, end)
        });
    });

    // ----------------
    function dateRangePickerMarginBottom() {
        const DATE_RANGE_PICKER = document.querySelector("div.daterangepicker")
        if (!DATE_RANGE_PICKER.classList.contains('padding-bottom-5'))
            DATE_RANGE_PICKER.classList.add('padding-bottom-5')
    }

    function radioChecked(input) {
        let parent = input.parentNode
        const picker = parent.querySelector('input.picker')

        picker.classList.remove('d-none')

        parent = parent.parentNode
        const list = parent.querySelectorAll('input.picker')

        for (let i of list)
            if (i != picker)
                i.classList.toggle('d-none')
    }

    function loadRevanueChart() {
        google.charts.load('current', { packages: ['corechart', 'line'] });
        google.charts.setOnLoadCallback(drawBackgroundColor);

        function drawBackgroundColor() {
            const data = new google.visualization.DataTable();
            data.addColumn('number', 'X');
            data.addColumn('number', 'Revanue');

            data.addRows([
                [1, 20], [2, 23], [3, 17], [4, 18], [5, 9],
                [6, 11], [7, 27], [8, 33], [9, 40], [10, 32]
            ]);

            const options = {
                hAxis: {
                    title: 'Month'
                },
                vAxis: {
                    title: 'Percentage'
                },
                backgroundColor: '#f1f8e9'
            };

            const chart = new google.visualization.LineChart(document.getElementById('revanue-line-chart'));
            chart.draw(data, options);
        }
    }

    loadRevanueChart()

    function loadPieChart() {
        google.charts.load("current", { packages: ["corechart"] });
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            const data = google.visualization.arrayToDataTable([
                ['Task', 'Hours per Day'],
                ['Work', 11],
                ['Eat', 2],
                ['Commute', 2],
                ['Watch TV', 2],
                ['Sleep', 7]
            ]);

            const options = {
                // title: 'My Daily Activities',
                is3D: true
            };

            const chart = new google.visualization.PieChart(document.getElementById('pie-chart'));
            chart.draw(data, options);
        }
    }

    loadPieChart()
</script>

</body>

</html>
