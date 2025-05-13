using System;
using System.Collections.Generic;

namespace PaperFabrkia.Entities;

public partial class Sklad
{
    public int IdMaterial { get; set; }

    public int IdPostavshik { get; set; }

    public decimal? StoimostEd { get; set; }

    public virtual Material IdMaterialNavigation { get; set; } = null!;

    public virtual Postavshik IdPostavshikNavigation { get; set; } = null!;
}
