<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
    
<!DOCTYPE html>
<html lang="en">
    <head>
    <!-- JS do Bootstrap (dependências) -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <style>
            .modal.right .modal-dialog {
                position: fixed;
                margin: auto;
                width: 320px;
                height: 100%;
                right: 0;
                top: 0;
                bottom: 0;
                left: auto;
                transform: translate3d(0%, 0, 0);
            }
            .modal.right .modal-content {
                height: 100%;
                overflow-y: auto;
                background-color: white;
            }
            .modal.right .modal-body {
                padding: 15px;
                overflow-y: auto;
            }
        </style>
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="index.jsp"><img src="assets/img/back2.jpg"  id="logo"   alt="..." /></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link" href="shop_pack.jsp">Packs</a></li>
                        <li class="nav-item"><a class="nav-link" href="shop_voos.jsp">Voos</a></li>
                        <li class="nav-item"><a class="nav-link" href="shop_hotel.jsp">Hoteis</a></li>
                        <li class="nav-item"><a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#cartModal">Carrinho</a></li>
                        <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
        <%
        if (session != null) {
            String nomeUsuario = (String) session.getAttribute("nome");
            String nomeEmail = (String) session.getAttribute("email");
            if (nomeUsuario != null) {
                out.print("| " + nomeUsuario);
            } else {
                out.print("Login");
            }
        } else {
            out.print("Login");
        }
        %>
    </a>
    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
        <%
        if (session != null) {
            String nomeUsuario = (String) session.getAttribute("nome");
            if (nomeUsuario != null) {
        %>
                <li><a class="dropdown-item" href="#" data-toggle="modal" data-target="#resetPasswordModal">Redefinir Senha</a></li>
        <%
            } else {
        %>
                <li><a class="dropdown-item" href="login.jsp">Login</a></li>
        <%
            }
        } else {
        %>
            <li><a class="dropdown-item" href="login.jsp">Login</a></li>
        <%
        }
        %>
    </ul>
</li>
                    </ul>
                </div>
            </div>
        </nav>
        
        <!-- Modal -->
<div class="modal fade" id="resetPasswordModal" tabindex="-1" role="dialog" aria-labelledby="resetPasswordModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="resetPasswordModalLabel">Redefinir Senha</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="resetPasswordForm" method="post" action="reset_password.jsp">
                    <div class="form-group">
                        <label for="newPassword">Nova Senha</label>
                        <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                    </div>
                    <div class="form-group">
                        <label for="confirmPassword">Confirmar Nova Senha</label>
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-primary">Redefinir Senha</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
        
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Reserve o seu Pack</h1>
                    <p class="lead fw-normal text-white-50 mb-0">With this shop hompeage template</p>
                </div>
            </div>
            <script>
			    // Exibe o pop-up de confirmação
			    function showConfirmationPopup() {
			        var myModal = new bootstrap.Modal(document.getElementById('confirmationPopup'));
			        myModal.show();
			    }
			    function showRemovePopup() {
			        var myModal = new bootstrap.Modal(document.getElementById('RemovePopup'));
			        myModal.show();
			    }
			</script>'
        </header>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="assets/img/portfolio/hotel_londres.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Pack Londres</h5>
                                    <!-- Product price-->
                                    $40.00 - $80.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <form action="add_to_cart.jsp" method="post">
                                        <input type="hidden" name="product_name" value="Pack Londres">
                                        <input type="hidden" name="product_price" value="40.00 - 80.00">
                                        <button type="submit" class="btn btn-outline-dark mt-auto" onclick="showConfirmationPopup()">Add to cart</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="assets/img/portfolio/hotel_dubai.jpeg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Pack Dubai</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">$20.00</span>
                                    $18.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <form action="add_to_cart.jsp" method="post">
                                        <input type="hidden" name="product_name" value="Pack Dubai">
                                        <input type="hidden" name="product_price" value="18.00">
                                        <button type="submit" class="btn btn-outline-dark mt-auto" onclick="showConfirmationPopup()">Add to cart</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="assets/img/portfolio/hotel_newyork.jpeg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Pack New York</h5>
                                    <span class="text-muted text-decoration-line-through">$50.00</span>
                                    $25.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <form action="add_to_cart.jsp" method="post">
                                        <input type="hidden" name="product_name" value="Pack New York">
                                        <input type="hidden" name="product_price" value="25.00">
                                        <button type="submit" class="btn btn-outline-dark mt-auto" onclick="showConfirmationPopup()">Add to cart</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="assets/img/portfolio/hotel_paris.jpeg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Pack Paris </h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    $40.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <form action="add_to_cart.jsp" method="post">
                                        <input type="hidden" name="product_name" value="Pack Paris">
                                        <input type="hidden" name="product_price" value="40.00">
                                        <button type="submit" class="btn btn-outline-dark mt-auto" onclick="showConfirmationPopup()">Add to cart</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Pop-up de confirmação -->
		<div id="confirmationPopup" class="modal fade" tabindex="-1">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h5 class="modal-title">Item Adicionado ao Carrinho</h5>
		            </div>
		            <div class="modal-body">
		                O item foi adicionado ao carrinho com sucesso!
		            </div>
		        </div>
		    </div>
		</div>
		<!-- Pop-up de confirmação -->
		<div id="RemovePopup" class="modal fade" tabindex="-1">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h5 class="modal-title">Item Adicionado ao Carrinho</h5>
		            </div>
		            <div class="modal-body">
		                O item foi removido do carrinho com sucesso!
		            </div>
		        </div>
		    </div>
		</div>
        <!-- Modal do carrinho -->
        <div class="modal fade right" id="cartModal" tabindex="-1" aria-labelledby="cartModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="cartModalLabel">Carrinho</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                       <!-- Exibe itens do carrinho -->
<%
    ArrayList<HashMap<String, String>> cart = (ArrayList<HashMap<String, String>>) session.getAttribute("cart");
    double totalPrice = 0; // Inicializa o preço total como 0
    if (cart != null && !cart.isEmpty()) {
        for (int i = 0; i < cart.size(); i++) {
            HashMap<String, String> item = cart.get(i);
            // Adiciona o preço do item ao preço total
            totalPrice += Double.parseDouble(item.get("price").replaceAll("[^\\d.]", ""));
%>
    <div class="cart-item">
        <p><%= item.get("name") %> - <%= item.get("price") %></p>
        <form action="remove_from_cart.jsp" method="post">
            <input type="hidden" name="index" value="<%= i %>">
            <button type="submit" class="btn btn-danger" onclick="showRemovePopup()">Remover</button>
        </form>
    </div>
<%
        }
    } else {
%>
    <p>Seu carrinho está vazio.</p>
<%
    }
%>

					<!-- Exibe o preço total -->
					<p>Preço Total: <%= String.format("%.2f", totalPrice) %></p>
                    </div>
                    <div class="modal-footer">
					    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Continuar comprando</button>
					    <form action="finalize_pruchase.jsp" method="post">
					        <button type="submit" class="btn btn-primary">Finalizar Compra</button>
					    </form>
					</div>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>

    </body>
</html>
