<%-- Document : FormulaireClient Created on : 21 sept. 2026, 13:10:21 Author : SUKUNA --%>
    <%@ include file='header.jsp' %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>
            </head>

            <body>
                <form action="InsertionClient" method="post">
                    <section style="height: 50vh;display: flex;justify-content: center;align-items: center;">
                        <div class="card">
                        <form>
                            <div class="mb-3">
                                <label class="form-label">Client Username</label>
                                <input type="text" class="form-control" id="exampleInputEmail1"
                                    aria-describedby="emailHelp" placeholder="John Doe" required name="nom">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <input type="email" class="form-control" id="exampleInputPassword1"
                                placeholder="JohnDoe@gmail.com" required name="email">
                            </div>
                            <div class="mb-3">
                                <label  class="form-label">Contact</label>
                                <input type="tel" class="form-control" id="exampleInputEmail1"
                                    aria-describedby="emailHelp" required placeholder="0XX XX XXX XX" maxlength="10" name="contact">
                            </div>
                            <button type="submit" class="btn btn-primary">Valider</button>
                        </form>
                        </div>
                    </section>
                </form>
            </body>

            </html>
            <%@ include file='footer.jsp' %>
            <style>
                .card {
                    color: var(--text);
                    width: 30%;
                    background: transparent;
                    border: 1px solid transparent;
                }
                .mb-3 input {
                    color: var(--text);
                    background: var(--card);
                    padding: 1rem 0px 1rem 0px;
                    border-radius: 20px;
                    border: 1px solid var(--text);

                }
                .mb-3 label {
                    font-size: 14px;
                }
            </style>