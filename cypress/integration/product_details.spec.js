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

  it("should navigate to the clicked product's details page", () => {
    cy.visit('/');
    cy.get('article').first().find('a').click(); // Click the first product's link
    cy.url().should('include', '/products/'); // Assert that the URL contains the product's ID
  });
});