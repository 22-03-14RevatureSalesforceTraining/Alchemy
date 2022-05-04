@isTest
private class TestProductsListController {
    @isTest static void testLaunch(){
        List<Product2> p = new List<Product2>();
        PageReference testPage = Page.ProductsListPage;
        Product2 test1 = new Product2(Name = 'Test Game 1');
        Product2 test2 = new Product2(Name = 'Test Game 2');
        
        p.add(test1);
        p.add(test2);
        insert p;
        
        Test.startTest();
        	Test.setCurrentPage(testPage);
        	ApexPages.StandardSetController sc = new ApexPages.StandardSetController(p);
        	sc.setSelected(p);
        	ProductsListController ext = new ProductsListController(sc);
        	testPage.getParameters().put('productName', String.valueOf(p[0].Name));
        	ext.launch();
        Test.stopTest();

    }
}