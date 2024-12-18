session_start();

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php?error=Моля, влезте в профила си, за да видите кошницата.');
    exit;
}

if (isset($_SESSION['cart']) && count($_SESSION['cart']) > 0) {
    echo '<h3>Вашата кошница</h3>';
    foreach ($_SESSION['cart'] as $item) {
        echo '<p>' . $item['product_title'] . ' - ' . $item['product_price'] . ' лв. - Количество: ' . $item['quantity'] . '</p>';
    }
} else {
    echo '<p>Вашата кошница е празна!</p>';
}
