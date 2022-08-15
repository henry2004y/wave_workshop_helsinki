### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# ╔═╡ c0c4e058-1c72-11ed-160f-137c1bb978b6
md"""
## Kinetic Effects in a Magnetic Field

When either the dc magnetic field $\mathbf{B}_0$ or the oscillating magnetic field $\mathbf{B}_1$ is finite, the $\mathbf{v}\times\mathbf{B}$ term in the Vlasov equation for a collisionless plasma must be included. The linearized equation is then replaced by

```math
\frac{\partial f_1}{\partial t} + \mathbf{v}\cdot\nabla f_1 +\frac{q}{m}(\mathbf{v}\times\mathbf{B}_0)\cdot\frac{\partial f_1}{\partial \mathbf{v}} = -\frac{q}{m}(\mathbf{E}_1 + \mathbf{v}\times\mathbf{B}_1)\cdot\frac{\partial f_0}{\partial \mathbf{v}}
```

Resonant particles moving along $\mathbf{B}_0$ still cause Landau damping if $\omega/k\simeq v_{th}$, but two new kinetic effects now appera which are connected with the velocity component $\mathbf{v}_\perp$ perpendicular to $\mathbf{B}_0$. One of these is cyclotron damping, which will be discussed later; the other is the generation of cyclotron harmonics, leading to the possibility of the oscillation commonly called Bernstein waves.

Harmonics of the cyclotron frequency are generated when the particles' circular Larmor orbits are distorted by the wave fields $\mathbf{E}_1$ and $\mathbf{B}_1$. These finite-$r_L$ effects are neglected in ordinary fluid theory but can be taken into account to order $k^2r_L^2$ by including the viscosity. A kinetic treatment can be accurate even for $k^2r_L^2 = \mathcal{O}(1)$. To understand how harmonics aris, consider the motion of a particle in an electric field:

```math
\mathbf{E} = E_x e^{i(kx-\omega t)}\hat{\mathbf{x}}
```

The equation of motion is

```math
\ddot{x} + \omega_c^2 x = \frac{1}{m}E_x e^{i(kx-\omega t)}
```

If $kr_L$ is not small, the exponent varies from one side of the orbit to the other. We can approximate $kx$ by substituting the undisturbed orbit $x=r_L\sin\omega_c t$

```math
\ddot{x} + \omega_c^2 x = \frac{1}{m}E_x e^{i(kr_L\sin\omega_c t-\omega t)}
```

The generating function for the Bessel function $J_n(z)$ is

```math
e^{z(t-1/t)/2} = \sum_{n=-\infty}^{\infty} t^n J_n(z)
```

Letting $z=kr_L$ and $t = \exp(i\omega_c t)$, we obtain

```math
e^{ikr_L\sin\omega_c t} = \sum_{n=-\infty}^{\infty} J_n(kr_L) e^{in\omega_c t}
```

```math
\ddot{x} + \omega_c^2 x = \frac{q}{m}E_x \sum_{n=-\infty}^{\infty}J_n(kr_L) e^{i(\omega-n\omega_c) t}
```

The following solution can be verified by direct substitution:

```math
x = \frac{q}{m}E_x \sum_{n=-\infty}^{\infty} \frac{J_n(kr_L)e^{i(\omega-n\omega_c) t}}{\omega_c^2 - (\omega - n\omega_c)^2}
```

This shows that the motion has frequency components differing from the driving frequency by multiples of $\omega_c$, and that the amplitudes of these components are proportional to $J_n(kr_L)/[\omega_c^2 - (\omega - n\omega_c)^2]$. When the denominator vanishes, the amplitude becomes large. This happens when $\omega-n\omega_c = \pm \omega_c$, or $\omega=(n\pm 1)\omega_c,\ n=0,\pm 1, \pm 2, ...$; that is, when the field $\mathbf{E}(x,t)$ resonates with any harmonic of $\omega_c$. In the fluid limit $kr_L\rightarrow 0$, $J_n(kr_L)$ can be approximated by $(kr_L/2)^n/n!$, which approaches 0 for all $n$ except $n=0$. For $n=0$, the coefficient becomes $(\omega_c^2-\omega^2)^{-1}$, which is the fluid result containing only the fundamental cyclotron frequency.
"""

# ╔═╡ 9590d7cc-d430-48a9-8af7-e213f0baa341
md"""
### The Hot Plasma Dielectric Tensor

After Fourier analysis of $f_1(\mathbf{r},\mathbf{v},t)$ in space and time, the linearized Vlasov equation can be solved for a Maxwellian distribution $f_0(\mathbf{v})$, and the resulting expression $f_1(\mathbf{k},\mathbf{v},\omega)$ can be used to calculate the density and current of each species. The result is usually expressed in the form of an equivalent dielectric tensor $\overleftrightarrow{\epsilon}$, such that the dispersion vector $\mathbf{D}=\overleftrightarrow{\epsilon}\cdot\mathbf{E}$ can be used in the Maxwell's equations to calculate dispersion relations for various waves. The algebra is horrendous and therefore omitted. We quote only a restricted result valid for nonrelativistic plasmas with isotropic pressure $T_\perp = T_\parallel$ and no zero-order drifts $\mathbf{v}_{0j}$; these restrictions are easily removed, but he general formulas are too cluttered for our purposes. We further assume $\mathbf{k} = k_x\hat{\mathbf{x}} + k_z\hat{\mathbf{z}}$, with $\hat{\mathbf{z}}$ being the direction of $\mathbf{B}_0$; no generality is lost by setting $k_y$ equal to zero, since the plasma is isotropic in the plane perpendicular to $\mathbf{B}_0$. The elements of $\overleftrightarrow{\epsilon}_R = \overleftrightarrow{\epsilon}/\epsilon_0$ are then

```math
\begin{align}
\epsilon_{xx} &= \\
\epsilon_{yy} &= \\
\epsilon_{zz} &= \\
\epsilon_{xz} &= \\
\epsilon_{yz} &= \\
\epsilon_{zx} &=
\end{align}
```

where $Z(\zeta)$ is the plasma dispersion function, $I_n(b)$ is the $n$th order Bessel function of imaginary argument, and the other symbols are defined by

```math
\begin{align}
\omega_{ps}^2 &= n_{0s} Z_s^2 e^2 / \epsilon_0 m_s \\
\zeta_s &= (\omega+n\omega_{cs})/k_z v_{ths} \\
\omega_{cs} &= |Z_seB_0/m_s| \\
v_{ths}^2 &= 2k_B T_s/m_s \\
b_s &= \frac{1}{2}k_\perp^2 r_{Ls} = k_x^2 k_B T_s / m_s \omega_{cs}^2
\end{align}
```

The first sum is over species $s$, with the understanding that $\omega_p, b, \zeta_0$, and $\zeta_n$ all depend on $s$, and that the $\pm$ stands for the sign of the charge. The second sum is over the harmonic number $n$. The primes indicate differentiation with respect to the argument.

As foreseen, there appera Bessel functions of finite-$r_L$ parameter $b$. (The change from $J_n(b)$ to $I_n(b)$ occurs in the integration over velocities.) The elements of $\overleftrightarrow{\epsilon}$ involving motion along $\hat{\mathbf{z}}$ contain $Z^\prime(\zeta_n)$, which gives rise to Landau damping when $n=0$ and $\omega/k_z\simeq v_{th}$. The $n\neq 0$ terms now make possible another collisionless damping mechanism, cyclotron damping, which occurs when $(\omega_c \pm n\omega_c)/k_z\simeq v_{th}$.
"""

# ╔═╡ cb7dcd55-8df3-494d-b649-64f4a4e35c39
md"""
### Cyclotron Damping

(I don't fully understand. ASK!!!)
When a particle moving along $\mathbf{B}_0$ in a wave with finite $k_z$ has the right velocity, it sees a Doppler-shifted frequency $\omega-k_z v_z$ equal to $\pm n \omega_c$ and is therefore subject to continuous acceleration by the electric field $\mathbf{E}_\perp$ of the wave. Those particles with the "right" phase relative to $\mathbf{E}_\perp$ will gain energy; those with the "wrong" phase will lose energy. Since the energy change is the force times the distance, the faster accelerated particles gain more energy per unit time than what the slower decelerated particles lose. There is, therefore, a net gain of energy by the particles, on the average, at the expense of the wave energy; and the wave is damped. This mechanism differs from Landau damping because the energy gained is in the direction perpendicular to $\mathbf{B}_0$, and hence perpendicular to the velocity component that brings the particle into resonance. The resonance is not easily destroyed by phenomena such as trapping. Furthermore, the mere existence of resonant particles suffices to cause damping; one does not need a negative slope $f_0^\prime(v_z)$, as in Landau damping. 

To clarify the physical mechanism of cyclotron damping, consider a wave with $\mathbf{k}=k_x\hat{\mathbf{x}}+k_z\hat{\mathbf{z}}$ with $k_z$ positive. The wave electric field $\mathbf{E}_\perp$ can be decomposed into left- and right-hand circularly polarized components, as shown in Fig.7-32(ADD IT!!!). For the left-hand component, the vector $\mathbf{E}_\perp$ at positions A, B, and C along the z axis appears as shown in Fig.7-32a. Since the wave propagates in the $+\hat{z}$ direction, a stationary electron would sample the vectors at C, B, and A in succession and therefore would see a left-rotating $\mathbf{E}$-field. It would not be accelerated because its Larmor gyration is in the right-hand (clockwise) direction. However, if the electron were moving faster than the wave in the $\hat{z}$ direction, it would see the vectors in A, B, and C in that order and hence would be resonantly accelerated if its velocity satisfied the condition $\omega-k_zv_z = -\omega_c$. (???) The right-hand component of $\mathbf{E}$ would appear as shown in Fig.7-32b. Now an electron would see a clockwise rotating $\mathbf{E}$-field if it moved more slowly than the wave, so that the vectors at C, B, and A were sampled in succession. ...
"""

# ╔═╡ 27386bc6-21d8-466c-a539-91998fce8cbd
md"""
### Bernstein Waves

Electrostatic waves propagating at right angles to $\mathbf{B}_0$ at harmonics of the cyclotron frequency are logfile.txt, phiprof*.txt and diagnostic.txt.b called Bernstein waves. The dispersion relation can be found by using the dielectric elements give in the previous section in Poisson's equation $\nabla\cdot\overleftrightarrow{\epsilon}\cdot\mathbf{E}=0$. If we assume electrostatic perturbations such that $\mathbf{E}_1=-\nabla\phi_0$, and consider waves of the form $\phi_1=\phi_1\exp i(\mathbf{k}\cdot\mathbf{r}-\omega t)$, Poisson\s equation can be written

```math
k_x^2 \epsilon_{xx} + 2k_x k_z \epsilon_{xz} + k_z^2 \epsilon_{zz} = 0
```

Note that we have chosen a coordinate system that has $\mathbf{k}$ lying in the x-z plane, so that $k_y=0$. We next substitute for $\epsilon_{xx},\epsilon_{xz}$, and $\epsilon_{zz}$ from the dielectric tensor expression and express $Z^\prime(\zeta_n)$ in terms of $Z(\zeta_n)$ with the identity

```math
Z^\prime(\zeta_n) = -2[1+\zeta Z(\zeta_n)]
```

via integration by parts. The equation becomes

```math
\begin{align}
k_x^2 + &k_z^2 + \sum_s\frac{\omega_p^2}{\omega^2}e^{-b}\zeta_0 \sum_{n=-\infty}^{\infty} I_n(b) \\
&\times \big[ k_x^2\frac{n^2}{b}Z - 2\big(\frac{2}{b}\big)^{1/2}nk_xk_z(1+\zeta_n Z)-2k_z^2 \zeta_n(1+\zeta_n Z) \big] = 0
\end{align}
```

The expression in the square brackets can be simplified in a few algebraic steps to $2k_z^2[\zeta_{-n} + \zeta_0^2 Z(\zeta_n)]$ by using the definitions $b = k_x^2 v_{th}^2/2\omega_c^2$ and $\zeta_n=(\omega+n\omega_c)/k_zv_{th}$. Further noticing that $2k_z^2 \omega_p^2 \zeta_0/\omega^2 = 2\omega_p^2/v_{th}^2\equiv k_D^2$ for each species, we can write the equation as

```math
k_x^2 + k_z^2 + \sum_s k_D^2 e^{-b}\sum_{n=-\infty}^{\infty} I_n(b)[\zeta_{-n}/\zeta_0 + \zeta_0 Z(\zeta_n)] = 0
```

The term $\zeta_{-n}/\zeta_0=1-n\omega_c/\omega$. Since $I_n(b)=I_{-n}(b)$, the term $I_n(b)n\omega_c/\omega$ sums to zero when $n$ goes from $-\infty$ to $\infty$; hence, $\zeta_{-n}/\zeta_0$ can be replaced by 1. Defining $k^2 = k_x^2 + k_z^2$, we obtain the general dispersion relation for Bernstein waves:

```math
1+ \sum_s\frac{k_D^2}{k_\perp^2}e^{-b}\sum_{n=-\infty}^{\infty} I_n(b)[1 + \zeta_0 Z(\zeta_n)] = 0
```

(A) _Electron Bernstein Waves_. Let us first consider high-frequency waves in which the ions do not move. These waves are not sensitive to small deviations from perpendicular propagation, and we may set $k_z=0$, so that $\zeta_n\rightarrow\infty$. There is, therefore, no cyclotron damping; the gaps in the spectrum that we shall find are not caused by such damping. For large $\zeta_n$, we may replace $Z(\zeta_n)$ by $-1/\zeta_n$. (???) The $n=0$ term in teh second sum of the above equation then cancels out, and we can divide the sum into two sums, as follows:

```math
k_\perp^2 + \sum_s k_D^2 e^{-b}\Big[ \sum_{n=1}^{\infty} I_n(b)(1 - \zeta_0 /\zeta_n) + \sum_{n=1}^{\infty} I_{-n}(b)(1 - \zeta_0 /\zeta_{-n})\Big] = 0
```

or

```math
k_\perp^2 + \sum_s k_D^2 e^{-b}\sum_{n=1}^{\infty} I_n(b)\Big[ 2-\frac{\omega}{\omega+n\omega_c} - \frac{\omega}{\omega-n\omega_c} \Big] = 0
```

The bracket collapses to a single term upon combining over a common denominator:

```math
1 = \sum_s \frac{k_D^2}{k_\perp^2}e^{-b}\sum_{n=1}^\infty I_n(b)\frac{2n^2\omega_c^2}{\omega^2 - n^2\omega_c^2}
```

Using the definitions of $k_D$ and $b$, one obtains the well-known (NOT TO ME!!!) $k_z=0$ dispersion relation

```math
1 = \sum_s \frac{\omega_p^2}{\omega_c^2}\frac{2}{b}e^{-b}\sum_{n=1}^\infty \frac{I_n(b)}{(\omega/n\omega_c)^2-1}
```

We now specialize to the case of electron oscillations. Dropping the sum over species, we obtain

```math
\frac{k_\perp^2}{k_D^2} = 2\omega_c^2 \sum_{n=1}^\infty \frac{e^{-b}I_n(b)}{\omega^2 - n\omega_c^2}n^2 \equiv \alpha(\omega, b)
```

... (ADD fig.7-33!!!)

To obtain the fluid limit, we repalce $I_n(b)$ by its small-$b$ value $(b/2)^n/n!$. Only the $n=1$ term remains in the limit $b\rightarrow 0$, and we obtain

```math
1 = \frac{\omega_p^2}{\omega_c^2}\frac{2}{b}\frac{b}{2}\Big( \frac{\omega^2}{\omega_c^2} - 1\Big)^{-1} = \frac{\omega_p^2}{\omega^2 - \omega_c^2}
```

or $\omega^2 = \omega_p^2 + \omega_c^2 = \omega_h^2$, which is the upper hybrid oscillation. As $k_\perp\rightarrow 0$, this frequency must be one of the roots. If $\omega_h$ falls between two high harmonics of $\omega_c$, the shape of the $\omega-k$ curves changes near $\omega = \omega_h$ to allow this to occur.
...

(B) _Ion Bernstein Waves_. In the case of waves at ion cyclotron harmonics, one has to distinguish between _pure_ ion Bernstein waves, for which $k_z=0$, and _neutralized_ ion Bernstein waves, for which $k_z$ has a small but finite value. The difference, as we have seen earlier for lower hybrid oscillations, is that finite $k_z$ allows electrons to flow along $\mathbf{B}_0$ to cancel charge separations. Though the $k_z=0$ case has already been treated in ...

"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.0-rc4"
manifest_format = "2.0"
project_hash = "da39a3ee5e6b4b0d3255bfef95601890afd80709"

[deps]
"""

# ╔═╡ Cell order:
# ╟─c0c4e058-1c72-11ed-160f-137c1bb978b6
# ╟─9590d7cc-d430-48a9-8af7-e213f0baa341
# ╟─cb7dcd55-8df3-494d-b649-64f4a4e35c39
# ╠═27386bc6-21d8-466c-a539-91998fce8cbd
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
