class CastleRiskGuard < Clearance::SignInGuard
  def call
    next_guard
  end
end
