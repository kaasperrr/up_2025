using System;
using System.Collections.Generic;

namespace PaperFabrkia.Entities;

public partial class Type
{
    public int IdType { get; set; }

    public string? NameType { get; set; }

    public virtual ICollection<Material> Materials { get; set; } = new List<Material>();
}
