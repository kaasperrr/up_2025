using System;
using System.Collections.Generic;

namespace PaperFabrkia.Entities;

public partial class MaterialProdukcium
{
    public int IdMaterial { get; set; }

    public int IdProdukcia { get; set; }

    public decimal? MinKolMaterial { get; set; }

    public virtual Material IdMaterialNavigation { get; set; } = null!;

    public virtual Produkcium IdProdukciaNavigation { get; set; } = null!;
}
