using WSUniversalLib;

namespace WSUniversalLibTests
{
    [TestFixture]
    public class CalculationTests
    {
        [Test]
        public void GetQuantityForProduct_InvalidProductType_ReturnsMinusOne()
        {
            int result = Calculation.GetQuantityForProduct(5, 1, 10, 5f, 5f);
            Assert.AreEqual(-1, result);
        }

        [Test]
        public void GetQuantityForProduct_InvalidMaterialType_ReturnsMinusOne()
        {
            int result = Calculation.GetQuantityForProduct(1, 3, 10, 5f, 5f);
            Assert.AreEqual(-1, result);
        }

        [Test]
        public void GetQuantityForProduct_NegativeCount_ReturnsMinusOne()
        {
            int result = Calculation.GetQuantityForProduct(1, 1, -5, 10f, 10f);
            Assert.AreEqual(-1, result);
        }

        [Test]
        public void GetQuantityForProduct_ZeroWidth_ReturnsMinusOne()
        {
            int result = Calculation.GetQuantityForProduct(2, 1, 10, 0f, 5f);
            Assert.AreEqual(-1, result);
        }

        [Test]
        public void GetQuantityForProduct_NegativeLength_ReturnsMinusOne()
        {
            int result = Calculation.GetQuantityForProduct(3, 2, 10, 5f, -2f);
            Assert.AreEqual(-1, result);
        }

        [Test]
        public void GetQuantityForProduct_ZeroCount_ReturnsMinusOne()
        {
            int result = Calculation.GetQuantityForProduct(1, 1, 0, 5f, 5f);
            Assert.AreEqual(-1, result);
        }

        [Test]
        public void GetQuantityForProduct_AllInvalidParams_ReturnsMinusOne()
        {
            int result = Calculation.GetQuantityForProduct(0, -1, -5, 0f, -1f);
            Assert.AreEqual(-1, result);
        }

        [Test]
        public void GetQuantityForProduct_ValidProductType3_ReturnsValidResult()
        {
            int result = Calculation.GetQuantityForProduct(3, 1, 1, 1f, 1f);
            Assert.IsTrue(result > 0);
        }

        [Test]
        public void GetQuantityForProduct_ValidMaterialType2_ReturnsValidResult()
        {
            int result = Calculation.GetQuantityForProduct(2, 2, 1, 1f, 1f);
            Assert.IsTrue(result > 0);
        }

        [Test]
        public void GetQuantityForProduct_MinValidValues_ReturnsValidResult()
        {
            int result = Calculation.GetQuantityForProduct(1, 1, 1, 1f, 1f);
            Assert.AreEqual(2, result);
        }

        [Test]
        public void GetQuantityForProduct_ExampleFromTask_Returns114148()
        {
            int result = Calculation.GetQuantityForProduct(3, 1, 15, 20f, 45f);
            Assert.AreEqual(114148, result);
        }

        [Test]
        public void GetQuantityForProduct_FractionalResult_RoundsUpCorrectly()
        {
            int result = Calculation.GetQuantityForProduct(1, 1, 1, 1f, 1f);
            Assert.AreEqual(2, result);
        }

        [Test]
        public void GetQuantityForProduct_CombinationType2Material2_CalculatesCorrectly()
        {
            int result = Calculation.GetQuantityForProduct(2, 2, 10, 2f, 3f);
            Assert.AreEqual(151, result);
        }

        [Test]
        public void GetQuantityForProduct_PrecisionTest_HandlesFloatingPointCorrectly()
        {
            int result = Calculation.GetQuantityForProduct(3, 2, 1, 0.1f, 0.1f);
            Assert.AreEqual(1, result);
        }
    }
}