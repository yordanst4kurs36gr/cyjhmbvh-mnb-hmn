<?php
// boilerplate index
require_once('./functions.php');
require_once('./db.php');

$page = $_GET['page'] ?? 'home';

$flash = [];
if (isset($_SESSION['flash'])) {
    $flash = $_SESSION['flash'];
    unset($_SESSION['flash']);
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Епродукт</title>
    <!-- Bootstrap 5.3 CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <style>
        /* Navbar Styles */
        .navbar-nav .nav-link {
        color: white ;
    }
        .navbar {
            background: 
                url('imagepresents.jpg') no-repeat center center,  /* First image */
                url('imagepresents2.jpg') no-repeat center center; /* Second image */
            background-size: cover; /* Ensure both images cover the area */
            background-blend-mode: overlay; /* Optional: Blend the images */
            padding: 20px 0; /* Adjust padding if needed */
        }

        .navbar .container-fluid {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        /* Additional styles for navbar */
        .navbar-brand {
            color: white;
            font-size: 1.5rem;
        }

        .btn {
            margin-left: 10px;
            color: white;
        }

        .btn-outline-light {
            border: 1px solid white;
            color: white;
        }

        .btn-outline-light:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }

        .text-white {
            color: white;
        }
    </style>
</head>
<body>
    <script>
        $(function() {
            // добавяне в любими
            $(document).on('click', '.add-favorite', function() {
                let btn = $(this);
                let productId = btn.data('product');

                $.ajax({
                    url: './ajax/add_favorite.php',
                    method: 'POST',
                    data: {
                        product_id: productId
                    },
                    success: function(response) {
                        let res = JSON.parse(response);
                        console.log(res);

                        if (res.success) {
                            alert('Продуктът беше добавен в любими');
                            let removeBtn = $(`<button class="btn btn-danger btn-sm remove-favorite" data-product="${productId}">Премахни от любими</button>`);
                            btn.replaceWith(removeBtn);
                        } else {
                            alert('Възникна грешка: ' + res.error);
                        }
                    },
                    error: function(error) {
                        console.error(error);
                    }
                });
            });

            // премахване от любими
            $(document).on('click', '.remove-favorite', function() {
                let btn = $(this);
                let productId = btn.data('product');

                $.ajax({
                    url: './ajax/remove_favorite.php',
                    method: 'POST',
                    data: {
                        product_id: productId
                    },
                    success: function(response) {
                        let res = JSON.parse(response);

                        if (res.success) {
                            alert('Продуктът беше премахнат от любими');
                            let addBtn = $(`<button class="btn btn-primary btn-sm add-favorite" data-product="${productId}">Добави в любими</button>`);
                            btn.replaceWith(addBtn);
                        } else {
                            alert('Възникна грешка: ' + res.error);
                        }
                    },
                    error: function(error) {
                        console.error(error);
                    }
                });
            });
        });
    </script>
    <header>
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand fw-bold" href="#">Епродукт</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link text-white <?php echo ($page == 'home' ? 'active' : ''); ?>" aria-current="page" href="?page=home">Начало</a>
                        </li>
                        <li class="nav-item dropdown">
    <a class="nav-link text-white dropdown-toggle <?php echo ($page == 'products' ? 'active' : ''); ?>" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
        Продукти
    </a>
    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
        <li><a class="dropdown-item <?php echo ($page == 'toys' ? 'active' : ''); ?>" href="?page=toys">Детски играчки</a></li>
        <li><a class="dropdown-item <?php echo ($page == 'phones' ? 'active' : ''); ?>" href="?page=phones">Телефони</a></li>
        <li><a class="dropdown-item <?php echo ($page == 'accessories' ? 'active' : ''); ?>" href="?page=accessories">Аксесоари</a></li>
        <li><a class="dropdown-item <?php echo ($page == 'pencils' ? 'active' : ''); ?>" href="?page=pencils">Моливи и химикали</a></li>
        <li><a class="dropdown-item <?php echo ($page == 'clothes' ? 'active' : ''); ?>" href="?page=clothes">Дрехи</a></li>
        <li><a class="dropdown-item <?php echo ($page == 'electronics' ? 'active' : ''); ?>" href="?page=electronics">Електроуреди</a></li>
    </ul>
</li>
                        <li class="nav-item">
                            <a class="nav-link text-white<?php echo ($page == 'contacts' ? 'active' : ''); ?>" href="?page=contacts">Контакти</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white<?php echo ($page == 'about_us' ? 'active' : ''); ?>" href="?page=about_us">За нас</a>
                        </li>
                        <li class="nav-item text-white">
    <?php if (isset($_SESSION['user_logged_in']) && $_SESSION['user_logged_in'] === true): ?>
        <a class="nav-link <?php echo ($page == 'add_product' ? 'active' : ''); ?>" href="?page=add_product">
            <i class="fas fa-plus-circle"></i> Добави продукт
        </a>
    <?php endif; ?>
</li>

                    </ul>
                    <div class="d-flex flex-row gap-3">
                        <?php
                            
                            if (isset($_SESSION['user_name'])) {
                                echo '<span class="text-white">Здравейте, ' . htmlspecialchars($_SESSION['user_name']) . '</span>';
                                echo '
                                    <form method="POST" action="./handlers/handle_logout.php" class="m-0">
                                        <button type="submit" class="btn btn-outline-light">Изход</button>
                                    </form>
                                    <a href="?page=cart" class="btn btn-outline-light">
                                        <i class="fas fa-shopping-cart"></i> Кошница
                                    </a>
                                ';
                            } else {
                                echo '<a href="?page=login" class="btn btn-outline-light">Вход</a>';
                                echo '<a href="?page=register" class="btn btn-outline-light">Регистрация</a>';
                            }
                            
                            
                        ?>
                    </div>
                </div>
            </div>
        </nav>
    </header>
    <main class="container py-4" style="min-height:80vh;">
        <?php
            if (isset($flash['message'])) {
                echo '
                    <div class="alert alert-' . $flash['message']['type'] . '" role="alert">
                        ' . $flash['message']['text'] . '
                    </div>
                ';
            }

            if (file_exists('pages/' . $page . '.php')) {
                require_once('pages/' . $page . '.php');
            } else {
                require_once('pages/not_found.php');
            }
        ?>
    </main>
    
    <footer class="bg-dark text-center py-5 mt-auto">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h5 class="text-light">За нас</h5>
                <p class="text-light">Епродукт е водещ онлайн магазин, предлагащ широка гама от продукти на конкурентни цени. Съсредоточени сме върху предоставянето на качествени стоки и безупречно обслужване на клиентите.</p>
            </div>
            <div class="col-md-4">
                <h5 class="text-light">Полезни линкове</h5>
                <ul class="list-unstyled">
                    <li><a href="/about-us" class="text-light">За нас</a></li>
                    <li><a href="/faq" class="text-light">Често задавани въпроси</a></li>
                    <li><a href="/privacy-policy" class="text-light">Политика за поверителност</a></li>
                    <li><a href="/terms-of-service" class="text-light">Общи условия</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <h5 class="text-light">Контакти</h5>
                <p class="text-light">Телефон: +359 123 456 789</p>
                <p class="text-light">Имейл: <a href="mailto:support@eprodukt.bg" class="text-light">support@eprodukt.bg</a></p>
                <p class="text-light">Адрес: бул. "Цариградско шосе" 125, София, България</p>
            </div>
        </div>
        <hr class="my-4">
        <div class="d-flex justify-content-center">
            <a href="https://www.facebook.com/eprodukt.bg" class="text-light me-3">
                <i class="fab fa-facebook"></i> Facebook
            </a>
            <a href="https://www.instagram.com/eprodukt.bg" class="text-light me-3">
                <i class="fab fa-instagram"></i> Instagram
            </a>
            <a href="https://www.twitter.com/eprodukt_bg" class="text-light">
                <i class="fab fa-twitter"></i> Twitter
            </a>
        </div>
        <hr class="my-4">
        <span class="text-light">© 2024 Епродукт. Всички права запазени.</span>
    </div>
</footer>

</body>
</html>