package testdbi;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import cn.net.dbi.test.service.PostionConvert;

public class TestConvertTree extends TestBase {
	long testSchemeId = 8;

	// @Autowired
	// TFactorRepository factorRepository;
	//
	// @Test
	// public void testTree() {
	// Factor f = factorRepository.findByMaxCountRelation(testSchemeId);
	// Assert.assertNotNull(f);
	// System.out.println(f.getSchemeId() + ";" + f.getCountRelation());
	// }

	@Autowired
	PostionConvert tree;

	@Test
	public void testTreeConvert() {
		PostionConvert.Circle t = tree.getTreeFacotr(testSchemeId);
		Assert.assertEquals(t.singleList.size(), 3);
		Assert.assertEquals(t.group.size(), 3);
	}
}
