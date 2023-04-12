describe('homepage', () => {

  it("should load the homepage", () => {
    cy.visit('/');
  });

  it("should show products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("should show 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("should click the 'Add to Cart' button for a product on the home page and in doing so their cart increases by one", () => {
    cy.get("nav .fa-shopping-cart").closest("a").should("contain", "My Cart (0)");
    cy.contains("Add").first().click({ force: true });
    cy.get("nav .fa-shopping-cart").closest("a").should("contain", "My Cart (1)");
  });
});