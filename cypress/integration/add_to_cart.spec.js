describe('Cart', () => {
  beforeEach(() => {
    // Cypress starts out with a blank slate for each test
    // so we must tell it to visit our website with the `cy.visit()` command.
    // Since we want to visit the same URL at the start of all our tests,
    // we include it in our beforeEach function so that it runs before each test
    cy.visit('/')
  })

  it ('should increase in size by 1 when the "add" button on a product is clicked', () => {
    cy.get('.add_cart').first().click({ force: true })
    cy.get(".end-0").should('contain', 'My Cart (1)')
  })
})
